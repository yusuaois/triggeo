import 'dart:io';

class ServiceStrings {
  // Supported languages
  static const String langZh = 'zh';
  static const String langEn = 'en';

  static const Map<String, Map<String, String>> _localizedValues = {
    langZh: {
      'bg_channel_name': '后台运行服务',
      'bg_channel_desc': '保持应用在后台检测位置',
      'bg_notification_title': 'Triggeo 后台检测',
      'bg_notification_content': '后台定位检测中...',
      'alert_channel_name': '位置到达提醒',
      'alert_channel_desc': '当到达目的地时发出提醒',
      'download_channel_name': '地图下载进度',
      'download_channel_desc': '显示离线地图下载的进度',
      'arrival_alert_title': '📍 到达提醒: ',
      'arrival_alert_body': '您已进入目标区域',
      'download_pretitle': '正在下载离线地图 (',
      'download_posttitle': ' 个任务)',
    },
    langEn: {
      'bg_channel_name': 'Background Service',
      'bg_channel_desc': 'Keep app running in background for location',
      'bg_notification_title': 'Triggeo Background',
      'bg_notification_content': 'Tracking location in background...',
      'alert_channel_name': 'Arrival Alert',
      'alert_channel_desc': 'Notify when arriving at destination',
      'download_channel_name': 'Map Download',
      'download_channel_desc': 'Show offline map download progress',
      'arrival_alert_title': '📍 Arrival Alert: ',
      'arrival_alert_body': 'You have entered the target area',
      'download_pretitle': 'Downloading offline map (',
      'download_posttitle': ' tasks)',
    },
  };

  static String _getLanguageCode([String? priorityLang]) {
    if (priorityLang != null && (priorityLang.startsWith('zh') || priorityLang.startsWith('en'))) {
      return priorityLang.startsWith('zh') ? langZh : langEn;
    }
    
    final String systemLocale = Platform.localeName; // zh_CN, en_US
    if (systemLocale.startsWith('zh')) {
      return langZh;
    }
    return langEn;
  }

  static String get(String key, {String? languageCode}) {
    final lang = _getLanguageCode(languageCode);
    return _localizedValues[lang]?[key] ?? _localizedValues[langEn]![key]!;
  }
}