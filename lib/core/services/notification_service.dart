import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:triggeo/l10n/service_strings.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Channel ID
  static const String channelIdBackground = 'triggeo_background_service';
  static const String channelIdAlert = 'triggeo_arrival_alert';
  static const String channelIdDownload = 'triggeo_download_progress';
  static const int _downloadNotificationId = 777;

  Future<void> initialize() async {
    await _requestNotificationPermissions();

    // Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await _notificationsPlugin.initialize(initializationSettings);

    await _createNotificationChannel(
      channelIdBackground,
      ServiceStrings.get('bg_channel_name'),
      ServiceStrings.get('bg_channel_desc'),
      // '后台运行服务',
      // '保持应用在后台检测位置',
      Importance.low,
    );

    await _createNotificationChannel(
      channelIdAlert,
      ServiceStrings.get('alert_channel_name'),
      ServiceStrings.get('alert_channel_desc'),
      // '位置到达提醒',
      // '当到达目的地时发出提醒',
      Importance.max,
      playSound: true,
    );

    if (Platform.isAndroid) {
      final AndroidNotificationChannel downloadChannel =
          AndroidNotificationChannel(
        channelIdDownload,
        // '地图下载进度',
        // description: '显示离线地图下载的进度',
        ServiceStrings.get('download_channel_name'),
        description: ServiceStrings.get('download_channel_desc'),
        importance: Importance.low,
        playSound: false,
        enableVibration: false,
        showBadge: false,
      );

      await _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(downloadChannel);
    }
  }

  Future<void> _requestNotificationPermissions() async {
    if (Platform.isIOS) {
      // iOS
      await _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      // Android 13+
      if (await Permission.notification.isRestricted) {
        return;
      }

      final status = await Permission.notification.status;
      if (!status.isGranted) {
        await Permission.notification.request();
      }
    }
  }

  Future<void> _createNotificationChannel(
      String id, String name, String desc, Importance importance,
      {bool playSound = false}) async {
    if (Platform.isAndroid) {
      final AndroidNotificationChannel channel = AndroidNotificationChannel(
        id,
        name,
        description: desc,
        importance: importance,
        playSound: playSound,
      );
      await _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    }
  }

  Future<void> showDownloadProgress(
      {required int progress,
      required int total,
      required int activeTasks}) async {
    final int percentage = total > 0 ? ((progress / total) * 100).toInt() : 0;
    final int safeProgress = progress > total ? total : progress;

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelIdDownload,
      // '地图下载进度',
      ServiceStrings.get('download_channel_name'),
      channelDescription: ServiceStrings.get('download_channel_desc'),
      importance: Importance.low,
      priority: Priority.low,
      onlyAlertOnce: true,
      showProgress: true,
      maxProgress: total,
      progress: safeProgress,
      ongoing: true,
      autoCancel: false,
    );

    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _notificationsPlugin.show(
      _downloadNotificationId,
      // 正在下载离线地图 ({activeTasks} 个任务)
      "${ServiceStrings.get('download_pretitle')}$activeTasks${ServiceStrings.get('download_posttitle')}",
      '$percentage% ($progress / $total)',
      platformChannelSpecifics,
    );
  }

  Future<void> cancelDownloadNotification() async {
    await _notificationsPlugin.cancel(_downloadNotificationId);
  }
}
