// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get helloWorld => 'こんにちは世界';

  @override
  String get mapApiKeyTitle => 'APIキー';

  @override
  String get mapApiKeyHint => 'APIキーを入力してください';

  @override
  String get mapCancel => 'キャンセル';

  @override
  String get mapConfirm => '確認';

  @override
  String needApiKey(Object name) {
    return '$name のAPIキーを設定してください';
  }

  @override
  String mapSearchFailed(Object error) {
    return '検索失敗: $error';
  }

  @override
  String mapGetLocationFailed(Object error) {
    return '位置情報取得失敗: $error';
  }

  @override
  String get mapLocating => '位置特定中...';

  @override
  String get mapSearchHint => '場所を検索';

  @override
  String get mapSearchEmptyError => '検索キーワードを入力してください';

  @override
  String mapLocationFailed(Object error) {
    return '位置特定失敗: $error';
  }

  @override
  String get mapLongPressHint => '地図上の任意の場所を長押ししてリマインダーを追加';

  @override
  String get mapNoSearchResults => '検索結果が見つかりませんでした';

  @override
  String settingsRingtoneSaved(Object ringtoneName) {
    return '着信音を保存しました: $ringtoneName';
  }

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsThemeSection => 'テーマ';

  @override
  String get settingsDynamic => 'ダイナミックカラー (Material You)';

  @override
  String get settingsSystemWallpaperColor => 'システムの壁紙の色に従う (Android 12+のみ)';

  @override
  String get settingsCustomThemeColor => 'カスタムテーマカラー';

  @override
  String get settingsDarkMode => 'ダークモード';

  @override
  String get settingsLightMode => 'ライトモード';

  @override
  String get settingsThemeSystem => 'システムに従う';

  @override
  String get settingsThemeLight => 'ライト';

  @override
  String get settingsThemeDark => 'ダーク';

  @override
  String get settingsReminderSection => 'リマインダー設定';

  @override
  String get settingsReminderType => 'リマインダーの種類';

  @override
  String get settingsReminderRingtone => '着信音';

  @override
  String get settingsReminderVibration => 'バイブレーション';

  @override
  String get settingsReminderBoth => '着信音とバイブレーション';

  @override
  String get settingsReminderVibrationNotSupport => 'このデバイスはバイブレーションに対応していません';

  @override
  String get settingsCustomRingtone => 'カスタム通知音';

  @override
  String get settingsPickRingtone => 'タップしてオーディオファイルを選択';

  @override
  String settingsRintoneFileNotFound(Object filePath) {
    return 'パス $filePath のオーディオファイルが見つかりません';
  }

  @override
  String settingsRintonePlayFiled(Object error) {
    return 'オーディオファイルの再生に失敗しました、エラー: $error';
  }

  @override
  String get settingsCustomVibrationPattern => 'カスタムバイブレーションパターン';

  @override
  String get settingsEditVibrationPattern => 'バイブレーションパターンの編集';

  @override
  String get settingsVibrationPatternHint => '例: 0, 100, 50, 100, 500, 200';

  @override
  String get settingsVibrationPatternHelp =>
      'カンマ区切りの整数リストを入力してください: 遅延, 継続時間, 遅延, 継続時間...（単位: ミリ秒）。';

  @override
  String settingsVibrationPatternSaved(Object pattern) {
    return 'バイブレーションパターンを保存しました: $pattern';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get settingsTestSetting => '現在の設定をテスト';

  @override
  String settingsDistanceFilter(Object distanceFilter) {
    return '位置情報更新距離 ($distanceFilter メートル)';
  }

  @override
  String get settingsDistanceFilterHint =>
      '位置情報更新の最小距離（メートル）を設定します。値が小さいほど頻繁に更新されますが、バッテリー消費が増えます。';

  @override
  String get settingsLocationUpdate => '位置情報更新設定';

  @override
  String get settingsMapDataSection => '地図とデータ';

  @override
  String get settingsOfflineMap => 'オフライン地図';

  @override
  String get settingsManageOfflineMap => 'ダウンロード済み地図の管理';

  @override
  String get settingsTileSource => '地図ソース';

  @override
  String get settingsTileSourceRestart => '地図ソースが切り替わりました。再起動後に有効になります。';

  @override
  String get offlineMapAddedToQueue => 'ダウンロードキューに追加されました';

  @override
  String get offlineMapTitle => 'オフライン地図管理';

  @override
  String get offlineMapTabNew => '新しい地図をダウンロード';

  @override
  String get offlineMapTabTasks => 'タスクとダウンロード済み';

  @override
  String get offlineMapLoadingData => 'オフライン地図データを読み込み中...';

  @override
  String offlineMapLoadFailed(Object error) {
    return '読み込み失敗: $error';
  }

  @override
  String get offlineMapSearchHint => '都市を検索';

  @override
  String get offlineMapSearchButton => '検索';

  @override
  String get offlineMapSearching => '検索中...';

  @override
  String get offlineMapNoResults => '検索結果が見つかりませんでした';

  @override
  String get offlineMapDownloadAction => 'ダウンロード';

  @override
  String offlineMapStatusDownloading(Object percent) {
    return 'ダウンロード中 $percent%';
  }

  @override
  String get offlineMapStatusCompleted => '完了';

  @override
  String get offlineMapStatusFailed => 'ダウンロード失敗';

  @override
  String get offlineMapStatusPaused => '一時停止';

  @override
  String get offlineMapStatusCanceled => 'キャンセル済み';

  @override
  String get offlineMapStatusPending => '保留中...';

  @override
  String get offlineMapPauseAction => '一時停止';

  @override
  String get offlineMapResumeAction => '再開';

  @override
  String get offlineMapDeleteAction => '削除';

  @override
  String get offlineMapNoTasks => 'タスクはありません';

  @override
  String get reminderNameRequired => '名前を入力してください';

  @override
  String reminderSaveFailed(Object error) {
    return '保存失敗: $error';
  }

  @override
  String get reminderDetailTitle => 'リマインダーを設定';

  @override
  String get reminderNameLabel => '場所の名前';

  @override
  String get reminderNameHint => '例: スーパー、会社';

  @override
  String reminderRadiusText(int radius) {
    return 'リマインダー半径: $radius メートル';
  }

  @override
  String get saveAction => '保存';

  @override
  String get reminderListTitle => 'マイリマインダー';

  @override
  String get reminderListEmpty => 'リマインダーはありません';

  @override
  String reminderListItemSubtitle(int radius, Object lat, Object lon) {
    return '半径: ${radius}m\n座標: $lat, $lon';
  }

  @override
  String get reminderEditTitle => 'リマインダーの追加/編集';

  @override
  String reminderDetailInfo(Object lat, Object lon) {
    return '緯度: $lat\n経度: $lon';
  }

  @override
  String get reminderCreated => 'リマインダーが作成されました';

  @override
  String get reminderUpdated => 'リマインダーが更新されました';

  @override
  String get cancelAction => 'キャンセル';

  @override
  String get backgroundServiceTitle => 'Triggeo バックグラウンド検出';

  @override
  String get backgroundServiceContent => 'バックグラウンドで位置を検出中...';

  @override
  String get backgroundServicePermissionError =>
      'バックグラウンドサービスを開始できません。位置情報の許可を与えていることを確認してください';

  @override
  String get backgroundServiceAlwaysPermissionError =>
      '位置情報の許可が不十分です。バックグラウンドリマインダー機能を正しく機能させるには、システム設定で「常に許可」を付与してください。';

  @override
  String get backgroundServiceStarted => 'バックグラウンド位置情報サービスが開始されました';

  @override
  String get backgroundServiceStopped => 'バックグラウンド位置情報サービスが停止されました';

  @override
  String locationServiceAlertTitle(Object name) {
    return 'リマインダー発動: $name';
  }

  @override
  String arrivalAlertTitle(Object name) {
    return '📍 到着リマインダー: $name';
  }

  @override
  String get arrivalAlertBody => '目標エリアに到着しました';

  @override
  String get backgroundChannelName => 'バックグラウンド実行サービス';

  @override
  String get backgroundChannelDesc => 'アプリがバックグラウンドで位置を検出し続ける';

  @override
  String get alertChannelName => '位置情報到着リマインダー';

  @override
  String get alertChannelDesc => '目的地に到着したときに通知する';

  @override
  String get downloadChannelName => '地図ダウンロード進捗';

  @override
  String get downloadChannelDesc => 'オフライン地図のダウンロード進捗を表示する';

  @override
  String downloadProgressTitle(int activeTasks) {
    return 'オフライン地図をダウンロード中 ($activeTasks タスク)';
  }

  @override
  String notificationDownloadFailedTitle(Object error) {
    return 'ダウンロード失敗: $error';
  }

  @override
  String get notificationDownloadFailedBody => 'ネットワークを確認して再試行してください';
}
