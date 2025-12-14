// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get helloWorld => '你好世界';

  @override
  String get mapApiKeyTitle => 'API 密钥';

  @override
  String get mapApiKeyHint => '请输入您的 API 密钥';

  @override
  String get mapCancel => '取消';

  @override
  String get mapConfirm => '确认';

  @override
  String needApiKey(Object name) {
    return '请为 $name 输入 API 密钥';
  }

  @override
  String mapSearchFailed(Object error) {
    return '搜索失败: $error';
  }

  @override
  String mapGetLocationFailed(Object error) {
    return '获取位置失败: $error';
  }

  @override
  String get mapLocating => '正在定位...';

  @override
  String get mapSearchHint => '搜索地点';

  @override
  String get mapSearchEmptyError => '请输入搜索关键词';

  @override
  String mapLocationFailed(Object error) {
    return '定位失败: $error';
  }

  @override
  String get mapLongPressHint => '长按地图任意位置添加提醒';

  @override
  String get mapNoSearchResults => '没有找到搜索结果';

  @override
  String settingsRingtoneSaved(Object ringtoneName) {
    return '铃声已保存: $ringtoneName';
  }

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsThemeSection => '主题';

  @override
  String get settingsDynamic => '动态取色 (Material You)';

  @override
  String get settingsSystemWallpaperColor => '跟随系统壁纸颜色 (仅Android 12+)';

  @override
  String get settingsCustomThemeColor => '自定义主题色';

  @override
  String get settingsDarkMode => '深色模式';

  @override
  String get settingsLightMode => '浅色模式';

  @override
  String get settingsThemeSystem => '跟随系统';

  @override
  String get settingsThemeLight => '浅色';

  @override
  String get settingsThemeDark => '深色';

  @override
  String get settingsReminderSection => '提醒设置';

  @override
  String get settingsReminderType => '提醒类型';

  @override
  String get settingsReminderRingtone => '响铃';

  @override
  String get settingsReminderVibration => '震动';

  @override
  String get settingsReminderBoth => '响铃与震动';

  @override
  String get settingsReminderVibrationNotSupport => '当前设备不支持震动';

  @override
  String get settingsCustomRingtone => '自定义提醒铃声';

  @override
  String get settingsPickRingtone => '点击选择音频文件';

  @override
  String settingsRintoneFileNotFound(Object filePath) {
    return '路径为 $filePath 的音频文件不存在';
  }

  @override
  String settingsRintonePlayFiled(Object error) {
    return '播放音频文件失败，错误信息: $error';
  }

  @override
  String get settingsCustomVibrationPattern => '自定义震动模式';

  @override
  String get settingsEditVibrationPattern => '编辑震动模式';

  @override
  String get settingsVibrationPatternHint => '例如: 0, 100, 50, 100, 500, 200';

  @override
  String get settingsVibrationPatternHelp =>
      '输入逗号分隔的整数列表：延迟, 持续时间, 延迟, 持续时间...（单位：毫秒）。';

  @override
  String settingsVibrationPatternSaved(Object pattern) {
    return '震动模式已保存: $pattern';
  }

  @override
  String get cancel => '取消';

  @override
  String get save => '保存';

  @override
  String get settingsTestSetting => '测试当前设置';

  @override
  String settingsDistanceFilter(Object distanceFilter) {
    return '位置更新距离($distanceFilter 米)';
  }

  @override
  String get settingsDistanceFilterHint =>
      '设置位置更新的最小距离（单位：米），数值越小位置更新越频繁，但耗电量越高';

  @override
  String get settingsLocationUpdate => '位置更新设置';

  @override
  String get settingsMapDataSection => '地图与数据';

  @override
  String get settingsOfflineMap => '离线地图';

  @override
  String get settingsManageOfflineMap => '管理已下载的地图';

  @override
  String get settingsTileSource => '地图源';

  @override
  String get settingsTileSourceRestart => '地图源已切换，重启应用生效';

  @override
  String get offlineMapAddedToQueue => '已加入下载队列';

  @override
  String get offlineMapTitle => '离线地图管理';

  @override
  String get offlineMapTabNew => '下载新地图';

  @override
  String get offlineMapTabTasks => '任务与已下载';

  @override
  String get offlineMapLoadingData => '正在加载离线地图数据...';

  @override
  String offlineMapLoadFailed(Object error) {
    return '加载失败: $error';
  }

  @override
  String get offlineMapSearchHint => '搜索城市';

  @override
  String get offlineMapSearchButton => '搜索';

  @override
  String get offlineMapSearching => '搜索中...';

  @override
  String get offlineMapNoResults => '没有找到搜索结果';

  @override
  String get offlineMapDownloadAction => '下载';

  @override
  String offlineMapStatusDownloading(Object percent) {
    return '下载中 $percent%';
  }

  @override
  String get offlineMapStatusCompleted => '已完成';

  @override
  String get offlineMapStatusFailed => '下载失败';

  @override
  String get offlineMapStatusPaused => '已暂停';

  @override
  String get offlineMapStatusCanceled => '已取消';

  @override
  String get offlineMapStatusPending => '等待中...';

  @override
  String get offlineMapPauseAction => '暂停';

  @override
  String get offlineMapResumeAction => '继续';

  @override
  String get offlineMapDeleteAction => '删除';

  @override
  String get offlineMapNoTasks => '暂无任务';

  @override
  String get reminderNameRequired => '请输入名称';

  @override
  String reminderSaveFailed(Object error) {
    return '保存失败: $error';
  }

  @override
  String get reminderDetailTitle => '设置提醒';

  @override
  String get reminderNameLabel => '位置名称';

  @override
  String get reminderNameHint => '例如：超市，公司';

  @override
  String reminderRadiusText(int radius) {
    return '提醒半径: $radius 米';
  }

  @override
  String get saveAction => '保存';

  @override
  String get reminderListTitle => '我的提醒';

  @override
  String get reminderListEmpty => '暂无提醒';

  @override
  String reminderListItemSubtitle(int radius, Object lat, Object lon) {
    return '半径: ${radius}m\n坐标: $lat, $lon';
  }

  @override
  String get reminderEditTitle => '添加/编辑提醒';

  @override
  String reminderDetailInfo(Object lat, Object lon) {
    return '纬度: $lat\n经度: $lon';
  }

  @override
  String get reminderCreated => '提醒已创建';

  @override
  String get reminderUpdated => '提醒已更新';

  @override
  String get cancelAction => '取消';

  @override
  String get backgroundServiceTitle => 'Triggeo 后台检测';

  @override
  String get backgroundServiceContent => '后台定位检测中...';

  @override
  String get backgroundServicePermissionError => '无法启动后台服务，请确保已授予位置权限';

  @override
  String get backgroundServiceAlwaysPermissionError =>
      '位置权限不足，请在系统设置中授予“始终”权限以确保后台提醒功能正常。';

  @override
  String get backgroundServiceStarted => '后台定位服务已启动';

  @override
  String get backgroundServiceStopped => '后台定位服务已停止';

  @override
  String locationServiceAlertTitle(Object name) {
    return '提醒触发: $name';
  }

  @override
  String arrivalAlertTitle(Object name) {
    return '📍 到达提醒: $name';
  }

  @override
  String get arrivalAlertBody => '您已到达目标区域';

  @override
  String get backgroundChannelName => '后台运行服务';

  @override
  String get backgroundChannelDesc => '保持应用在后台检测位置';

  @override
  String get alertChannelName => '位置到达提醒';

  @override
  String get alertChannelDesc => '当到达目的地时发出提醒';

  @override
  String get downloadChannelName => '地图下载进度';

  @override
  String get downloadChannelDesc => '显示离线地图下载的进度';

  @override
  String downloadProgressTitle(int activeTasks) {
    return '正在下载离线地图 ($activeTasks 个任务)';
  }

  @override
  String notificationDownloadFailedTitle(Object error) {
    return '下载失败: $error';
  }

  @override
  String get notificationDownloadFailedBody => '请检查网络并重试';
}

/// The translations for Chinese, using the Han script (`zh_Hans`).
class AppLocalizationsZhHans extends AppLocalizationsZh {
  AppLocalizationsZhHans() : super('zh_Hans');

  @override
  String get helloWorld => '你好世界';

  @override
  String get mapApiKeyTitle => 'API 密钥';

  @override
  String get mapApiKeyHint => '请输入您的 API 密钥';

  @override
  String get mapCancel => '取消';

  @override
  String get mapConfirm => '确认';

  @override
  String needApiKey(Object name) {
    return '请为 $name 输入 API 密钥';
  }

  @override
  String mapSearchFailed(Object error) {
    return '搜索失败: $error';
  }

  @override
  String mapGetLocationFailed(Object error) {
    return '获取位置失败: $error';
  }

  @override
  String get mapLocating => '正在定位...';

  @override
  String get mapSearchHint => '搜索地点';

  @override
  String get mapSearchEmptyError => '请输入搜索关键词';

  @override
  String mapLocationFailed(Object error) {
    return '定位失败: $error';
  }

  @override
  String get mapLongPressHint => '长按地图任意位置添加提醒';

  @override
  String get mapNoSearchResults => '没有找到搜索结果';

  @override
  String settingsRingtoneSaved(Object ringtoneName) {
    return '铃声已保存: $ringtoneName';
  }

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsThemeSection => '主题';

  @override
  String get settingsDynamic => '动态取色 (Material You)';

  @override
  String get settingsSystemWallpaperColor => '跟随系统壁纸颜色 (仅Android 12+)';

  @override
  String get settingsCustomThemeColor => '自定义主题色';

  @override
  String get settingsDarkMode => '深色模式';

  @override
  String get settingsLightMode => '浅色模式';

  @override
  String get settingsThemeSystem => '跟随系统';

  @override
  String get settingsThemeLight => '浅色';

  @override
  String get settingsThemeDark => '深色';

  @override
  String get settingsReminderSection => '提醒设置';

  @override
  String get settingsReminderType => '提醒类型';

  @override
  String get settingsReminderRingtone => '响铃';

  @override
  String get settingsReminderVibration => '震动';

  @override
  String get settingsReminderBoth => '响铃与震动';

  @override
  String get settingsReminderVibrationNotSupport => '当前设备不支持震动';

  @override
  String get settingsCustomRingtone => '自定义提醒铃声';

  @override
  String get settingsPickRingtone => '点击选择音频文件';

  @override
  String settingsRintoneFileNotFound(Object filePath) {
    return '路径为 $filePath 的音频文件不存在';
  }

  @override
  String settingsRintonePlayFiled(Object error) {
    return '播放音频文件失败，错误信息: $error';
  }

  @override
  String get settingsCustomVibrationPattern => '自定义震动模式';

  @override
  String get settingsEditVibrationPattern => '编辑震动模式';

  @override
  String get settingsVibrationPatternHint => '例如: 0, 100, 50, 100, 500, 200';

  @override
  String get settingsVibrationPatternHelp =>
      '输入逗号分隔的整数列表：延迟, 持续时间, 延迟, 持续时间...（单位：毫秒）。';

  @override
  String settingsVibrationPatternSaved(Object pattern) {
    return '震动模式已保存: $pattern';
  }

  @override
  String get cancel => '取消';

  @override
  String get save => '保存';

  @override
  String get settingsTestSetting => '测试当前设置';

  @override
  String settingsDistanceFilter(Object distanceFilter) {
    return '位置更新距离($distanceFilter 米)';
  }

  @override
  String get settingsDistanceFilterHint =>
      '设置位置更新的最小距离（单位：米），数值越小位置更新越频繁，但耗电量越高';

  @override
  String get settingsLocationUpdate => '位置更新设置';

  @override
  String get settingsMapDataSection => '地图与数据';

  @override
  String get settingsOfflineMap => '离线地图';

  @override
  String get settingsManageOfflineMap => '管理已下载的地图';

  @override
  String get settingsTileSource => '地图源';

  @override
  String get settingsTileSourceRestart => '地图源已切换，重启应用生效';

  @override
  String get offlineMapAddedToQueue => '已加入下载队列';

  @override
  String get offlineMapTitle => '离线地图管理';

  @override
  String get offlineMapTabNew => '下载新地图';

  @override
  String get offlineMapTabTasks => '任务与已下载';

  @override
  String get offlineMapLoadingData => '正在加载离线地图数据...';

  @override
  String offlineMapLoadFailed(Object error) {
    return '加载失败: $error';
  }

  @override
  String get offlineMapSearchHint => '搜索城市';

  @override
  String get offlineMapSearchButton => '搜索';

  @override
  String get offlineMapSearching => '搜索中...';

  @override
  String get offlineMapNoResults => '没有找到搜索结果';

  @override
  String get offlineMapDownloadAction => '下载';

  @override
  String offlineMapStatusDownloading(Object percent) {
    return '下载中 $percent%';
  }

  @override
  String get offlineMapStatusCompleted => '已完成';

  @override
  String get offlineMapStatusFailed => '下载失败';

  @override
  String get offlineMapStatusPaused => '已暂停';

  @override
  String get offlineMapStatusCanceled => '已取消';

  @override
  String get offlineMapStatusPending => '等待中...';

  @override
  String get offlineMapPauseAction => '暂停';

  @override
  String get offlineMapResumeAction => '继续';

  @override
  String get offlineMapDeleteAction => '删除';

  @override
  String get offlineMapNoTasks => '暂无任务';

  @override
  String get reminderNameRequired => '请输入名称';

  @override
  String reminderSaveFailed(Object error) {
    return '保存失败: $error';
  }

  @override
  String get reminderDetailTitle => '设置提醒';

  @override
  String get reminderNameLabel => '位置名称';

  @override
  String get reminderNameHint => '例如：超市，公司';

  @override
  String reminderRadiusText(int radius) {
    return '提醒半径: $radius 米';
  }

  @override
  String get saveAction => '保存';

  @override
  String get reminderListTitle => '我的提醒';

  @override
  String get reminderListEmpty => '暂无提醒';

  @override
  String reminderListItemSubtitle(int radius, Object lat, Object lon) {
    return '半径: ${radius}m\n坐标: $lat, $lon';
  }

  @override
  String get reminderEditTitle => '添加/编辑提醒';

  @override
  String reminderDetailInfo(Object lat, Object lon) {
    return '纬度: $lat\n经度: $lon';
  }

  @override
  String get reminderCreated => '提醒已创建';

  @override
  String get reminderUpdated => '提醒已更新';

  @override
  String get cancelAction => '取消';

  @override
  String get backgroundServiceTitle => 'Triggeo 后台检测';

  @override
  String get backgroundServiceContent => '后台定位检测中...';

  @override
  String get backgroundServicePermissionError => '无法启动后台服务，请确保已授予位置权限';

  @override
  String get backgroundServiceAlwaysPermissionError =>
      '位置权限不足，请在系统设置中授予“始终”权限以确保后台提醒功能正常。';

  @override
  String get backgroundServiceStarted => '后台定位服务已启动';

  @override
  String get backgroundServiceStopped => '后台定位服务已停止';

  @override
  String locationServiceAlertTitle(Object name) {
    return '提醒触发: $name';
  }

  @override
  String arrivalAlertTitle(Object name) {
    return '📍 到达提醒: $name';
  }

  @override
  String get arrivalAlertBody => '您已到达目标区域';

  @override
  String get backgroundChannelName => '后台运行服务';

  @override
  String get backgroundChannelDesc => '保持应用在后台检测位置';

  @override
  String get alertChannelName => '位置到达提醒';

  @override
  String get alertChannelDesc => '当到达目的地时发出提醒';

  @override
  String get downloadChannelName => '地图下载进度';

  @override
  String get downloadChannelDesc => '显示离线地图下载的进度';

  @override
  String downloadProgressTitle(int activeTasks) {
    return '正在下载离线地图 ($activeTasks 个任务)';
  }

  @override
  String notificationDownloadFailedTitle(Object error) {
    return '下载失败: $error';
  }

  @override
  String get notificationDownloadFailedBody => '请检查网络并重试';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get helloWorld => '哈囉世界';

  @override
  String get mapApiKeyTitle => 'API 密鑰';

  @override
  String get mapApiKeyHint => '請輸入您的 API 密鑰';

  @override
  String get mapCancel => '取消';

  @override
  String get mapConfirm => '確認';

  @override
  String needApiKey(Object name) {
    return '請為 $name 輸入 API 密鑰';
  }

  @override
  String mapSearchFailed(Object error) {
    return '搜尋失敗: $error';
  }

  @override
  String mapGetLocationFailed(Object error) {
    return '取得位置失敗: $error';
  }

  @override
  String get mapLocating => '正在定位...';

  @override
  String get mapSearchHint => '搜尋地點';

  @override
  String get mapSearchEmptyError => '請輸入搜尋關鍵詞';

  @override
  String mapLocationFailed(Object error) {
    return '定位失敗: $error';
  }

  @override
  String get mapLongPressHint => '長按地圖任意位置新增提醒';

  @override
  String get mapNoSearchResults => '沒有找到搜尋結果';

  @override
  String settingsRingtoneSaved(Object ringtoneName) {
    return '鈴聲已儲存: $ringtoneName';
  }

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsThemeSection => '主題';

  @override
  String get settingsDynamic => '動態取色 (Material You)';

  @override
  String get settingsSystemWallpaperColor => '跟隨系統桌布顏色 (僅 Android 12+)';

  @override
  String get settingsCustomThemeColor => '自訂主題色';

  @override
  String get settingsDarkMode => '深色模式';

  @override
  String get settingsLightMode => '淺色模式';

  @override
  String get settingsThemeSystem => '跟隨系統';

  @override
  String get settingsThemeLight => '淺色';

  @override
  String get settingsThemeDark => '深色';

  @override
  String get settingsReminderSection => '提醒設定';

  @override
  String get settingsReminderType => '提醒類型';

  @override
  String get settingsReminderRingtone => '響鈴';

  @override
  String get settingsReminderVibration => '震動';

  @override
  String get settingsReminderBoth => '響鈴與震動';

  @override
  String get settingsReminderVibrationNotSupport => '當前裝置不支援震動';

  @override
  String get settingsCustomRingtone => '自訂提醒鈴聲';

  @override
  String get settingsPickRingtone => '點擊選擇音訊檔案';

  @override
  String settingsRintoneFileNotFound(Object filePath) {
    return '路徑為 $filePath 的音訊檔案不存在';
  }

  @override
  String settingsRintonePlayFiled(Object error) {
    return '播放音訊檔案失敗，錯誤訊息: $error';
  }

  @override
  String get settingsCustomVibrationPattern => '自訂震動模式';

  @override
  String get settingsEditVibrationPattern => '編輯震動模式';

  @override
  String get settingsVibrationPatternHint => '例如: 0, 100, 50, 100, 500, 200';

  @override
  String get settingsVibrationPatternHelp =>
      '輸入逗號分隔的整數列表：延遲, 持續時間, 延遲, 持續時間...（單位：毫秒）。';

  @override
  String settingsVibrationPatternSaved(Object pattern) {
    return '震動模式已儲存: $pattern';
  }

  @override
  String get cancel => '取消';

  @override
  String get save => '儲存';

  @override
  String get settingsTestSetting => '測試當前設定';

  @override
  String settingsDistanceFilter(Object distanceFilter) {
    return '位置更新距離($distanceFilter 米)';
  }

  @override
  String get settingsDistanceFilterHint =>
      '設定位置更新的最小距離（單位：米），數值越小位置更新越頻繁，但耗電量越高';

  @override
  String get settingsLocationUpdate => '位置更新設定';

  @override
  String get settingsMapDataSection => '地圖與資料';

  @override
  String get settingsOfflineMap => '離線地圖';

  @override
  String get settingsManageOfflineMap => '管理已下載的地圖';

  @override
  String get settingsTileSource => '地圖源';

  @override
  String get settingsTileSourceRestart => '地圖源已切換，重啟應用程式生效';

  @override
  String get offlineMapAddedToQueue => '已加入下載佇列';

  @override
  String get offlineMapTitle => '離線地圖管理';

  @override
  String get offlineMapTabNew => '下載新地圖';

  @override
  String get offlineMapTabTasks => '任務與已下載';

  @override
  String get offlineMapLoadingData => '正在載入離線地圖資料...';

  @override
  String offlineMapLoadFailed(Object error) {
    return '載入失敗: $error';
  }

  @override
  String get offlineMapSearchHint => '搜尋城市';

  @override
  String get offlineMapSearchButton => '搜尋';

  @override
  String get offlineMapSearching => '搜尋中...';

  @override
  String get offlineMapNoResults => '沒有找到搜尋結果';

  @override
  String get offlineMapDownloadAction => '下載';

  @override
  String offlineMapStatusDownloading(Object percent) {
    return '下載中 $percent%';
  }

  @override
  String get offlineMapStatusCompleted => '已完成';

  @override
  String get offlineMapStatusFailed => '下載失敗';

  @override
  String get offlineMapStatusPaused => '已暫停';

  @override
  String get offlineMapStatusCanceled => '已取消';

  @override
  String get offlineMapStatusPending => '等待中...';

  @override
  String get offlineMapPauseAction => '暫停';

  @override
  String get offlineMapResumeAction => '繼續';

  @override
  String get offlineMapDeleteAction => '刪除';

  @override
  String get offlineMapNoTasks => '暫無任務';

  @override
  String get reminderNameRequired => '請輸入名稱';

  @override
  String reminderSaveFailed(Object error) {
    return '儲存失敗: $error';
  }

  @override
  String get reminderDetailTitle => '設定提醒';

  @override
  String get reminderNameLabel => '位置名稱';

  @override
  String get reminderNameHint => '例如：超市，公司';

  @override
  String reminderRadiusText(int radius) {
    return '提醒半徑: $radius 米';
  }

  @override
  String get saveAction => '儲存';

  @override
  String get reminderListTitle => '我的提醒';

  @override
  String get reminderListEmpty => '暫無提醒';

  @override
  String reminderListItemSubtitle(int radius, Object lat, Object lon) {
    return '半徑: ${radius}m\n座標: $lat, $lon';
  }

  @override
  String get reminderEditTitle => '新增/編輯提醒';

  @override
  String reminderDetailInfo(Object lat, Object lon) {
    return '緯度: $lat\n經度: $lon';
  }

  @override
  String get reminderCreated => '提醒已建立';

  @override
  String get reminderUpdated => '提醒已更新';

  @override
  String get cancelAction => '取消';

  @override
  String get backgroundServiceTitle => 'Triggeo 背景偵測';

  @override
  String get backgroundServiceContent => '背景定位偵測中...';

  @override
  String get backgroundServicePermissionError => '無法啟動背景服務，請確保已授予位置權限';

  @override
  String get backgroundServiceAlwaysPermissionError =>
      '位置權限不足，請在系統設定中授予「永遠」權限以確保背景提醒功能正常。';

  @override
  String get backgroundServiceStarted => '背景定位服務已啟動';

  @override
  String get backgroundServiceStopped => '背景定位服務已停止';

  @override
  String locationServiceAlertTitle(Object name) {
    return '提醒觸發: $name';
  }

  @override
  String arrivalAlertTitle(Object name) {
    return '📍 到達提醒: $name';
  }

  @override
  String get arrivalAlertBody => '您已到達目標區域';

  @override
  String get backgroundChannelName => '背景運行服務';

  @override
  String get backgroundChannelDesc => '保持應用程式在背景偵測位置';

  @override
  String get alertChannelName => '位置到達提醒';

  @override
  String get alertChannelDesc => '當到達目的地時發出提醒';

  @override
  String get downloadChannelName => '地圖下載進度';

  @override
  String get downloadChannelDesc => '顯示離線地圖下載的進度';

  @override
  String downloadProgressTitle(int activeTasks) {
    return '正在下載離線地圖 ($activeTasks 個任務)';
  }

  @override
  String notificationDownloadFailedTitle(Object error) {
    return '下載失敗: $error';
  }

  @override
  String get notificationDownloadFailedBody => '請檢查網路並重試';
}
