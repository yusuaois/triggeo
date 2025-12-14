// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get helloWorld => '안녕하세요 세계';

  @override
  String get mapApiKeyTitle => 'API 키';

  @override
  String get mapApiKeyHint => 'API 키를 입력하세요';

  @override
  String get mapCancel => '취소';

  @override
  String get mapConfirm => '확인';

  @override
  String needApiKey(Object name) {
    return '$name 에 대한 API 키를 설정해주세요';
  }

  @override
  String mapSearchFailed(Object error) {
    return '검색 실패: $error';
  }

  @override
  String mapGetLocationFailed(Object error) {
    return '위치 정보 가져오기 실패: $error';
  }

  @override
  String get mapLocating => '위치 찾는 중...';

  @override
  String get mapSearchHint => '장소 검색';

  @override
  String get mapSearchEmptyError => '검색어를 입력하세요';

  @override
  String mapLocationFailed(Object error) {
    return '위치 찾기 실패: $error';
  }

  @override
  String get mapLongPressHint => '지도의 아무 곳이나 길게 눌러 알림 추가';

  @override
  String get mapNoSearchResults => '검색 결과가 없습니다';

  @override
  String settingsRingtoneSaved(Object ringtoneName) {
    return '벨소리 저장됨: $ringtoneName';
  }

  @override
  String get settingsTitle => '설정';

  @override
  String get settingsThemeSection => '테마';

  @override
  String get settingsDynamic => '동적 색상 (Material You)';

  @override
  String get settingsSystemWallpaperColor =>
      '시스템 배경화면 색상 따르기 (Android 12+만 해당)';

  @override
  String get settingsCustomThemeColor => '사용자 정의 테마 색상';

  @override
  String get settingsDarkMode => '다크 모드';

  @override
  String get settingsLightMode => '라이트 모드';

  @override
  String get settingsThemeSystem => '시스템 설정 따르기';

  @override
  String get settingsThemeLight => '밝게';

  @override
  String get settingsThemeDark => '어둡게';

  @override
  String get settingsReminderSection => '알림 설정';

  @override
  String get settingsReminderType => '알림 유형';

  @override
  String get settingsReminderRingtone => '벨소리';

  @override
  String get settingsReminderVibration => '진동';

  @override
  String get settingsReminderBoth => '벨소리 및 진동';

  @override
  String get settingsReminderVibrationNotSupport => '이 기기는 진동을 지원하지 않습니다';

  @override
  String get settingsCustomRingtone => '사용자 정의 알림음';

  @override
  String get settingsPickRingtone => '눌러서 오디오 파일 선택';

  @override
  String settingsRintoneFileNotFound(Object filePath) {
    return '경로 $filePath 에 오디오 파일을 찾을 수 없습니다';
  }

  @override
  String settingsRintonePlayFiled(Object error) {
    return '오디오 파일 재생 실패, 오류: $error';
  }

  @override
  String get settingsCustomVibrationPattern => '사용자 정의 진동 패턴';

  @override
  String get settingsEditVibrationPattern => '진동 패턴 편집';

  @override
  String get settingsVibrationPatternHint => '예: 0, 100, 50, 100, 500, 200';

  @override
  String get settingsVibrationPatternHelp =>
      '쉼표로 구분된 정수 목록을 입력하세요: 지연, 지속 시간, 지연, 지속 시간... (단위: 밀리초).';

  @override
  String settingsVibrationPatternSaved(Object pattern) {
    return '진동 패턴 저장됨: $pattern';
  }

  @override
  String get cancel => '취소';

  @override
  String get save => '저장';

  @override
  String get settingsTestSetting => '현재 설정 테스트';

  @override
  String settingsDistanceFilter(Object distanceFilter) {
    return '위치 업데이트 거리 ($distanceFilter 미터)';
  }

  @override
  String get settingsDistanceFilterHint =>
      '위치 업데이트의 최소 거리(미터)를 설정합니다. 값이 작을수록 업데이트 빈도가 높아지지만 배터리 소모가 증가합니다.';

  @override
  String get settingsLocationUpdate => '위치 업데이트 설정';

  @override
  String get settingsMapDataSection => '지도 및 데이터';

  @override
  String get settingsOfflineMap => '오프라인 지도';

  @override
  String get settingsManageOfflineMap => '다운로드한 지도 관리';

  @override
  String get settingsTileSource => '지도 소스';

  @override
  String get settingsTileSourceRestart => '지도 소스가 변경되었습니다. 앱을 다시 시작해야 적용됩니다.';

  @override
  String get offlineMapAddedToQueue => '다운로드 대기열에 추가되었습니다';

  @override
  String get offlineMapTitle => '오프라인 지도 관리';

  @override
  String get offlineMapTabNew => '새 지도 다운로드';

  @override
  String get offlineMapTabTasks => '작업 및 다운로드';

  @override
  String get offlineMapLoadingData => '오프라인 지도 데이터 로드 중...';

  @override
  String offlineMapLoadFailed(Object error) {
    return '로드 실패: $error';
  }

  @override
  String get offlineMapSearchHint => '도시 검색';

  @override
  String get offlineMapSearchButton => '검색';

  @override
  String get offlineMapSearching => '검색 중...';

  @override
  String get offlineMapNoResults => '검색 결과가 없습니다';

  @override
  String get offlineMapDownloadAction => '다운로드';

  @override
  String offlineMapStatusDownloading(Object percent) {
    return '다운로드 중 $percent%';
  }

  @override
  String get offlineMapStatusCompleted => '완료';

  @override
  String get offlineMapStatusFailed => '다운로드 실패';

  @override
  String get offlineMapStatusPaused => '일시 중지됨';

  @override
  String get offlineMapStatusCanceled => '취소됨';

  @override
  String get offlineMapStatusPending => '대기 중...';

  @override
  String get offlineMapPauseAction => '일시 중지';

  @override
  String get offlineMapResumeAction => '재개';

  @override
  String get offlineMapDeleteAction => '삭제';

  @override
  String get offlineMapNoTasks => '작업 없음';

  @override
  String get reminderNameRequired => '이름을 입력하세요';

  @override
  String reminderSaveFailed(Object error) {
    return '저장 실패: $error';
  }

  @override
  String get reminderDetailTitle => '알림 설정';

  @override
  String get reminderNameLabel => '위치 이름';

  @override
  String get reminderNameHint => '예: 마트, 회사';

  @override
  String reminderRadiusText(int radius) {
    return '알림 반경: $radius 미터';
  }

  @override
  String get saveAction => '저장';

  @override
  String get reminderListTitle => '내 알림';

  @override
  String get reminderListEmpty => '알림 없음';

  @override
  String reminderListItemSubtitle(int radius, Object lat, Object lon) {
    return '반경: ${radius}m\n좌표: $lat, $lon';
  }

  @override
  String get reminderEditTitle => '알림 추가/편집';

  @override
  String reminderDetailInfo(Object lat, Object lon) {
    return '위도: $lat\n경도: $lon';
  }

  @override
  String get reminderCreated => '알림이 생성되었습니다';

  @override
  String get reminderUpdated => '알림이 업데이트되었습니다';

  @override
  String get cancelAction => '취소';

  @override
  String get backgroundServiceTitle => 'Triggeo 백그라운드 감지';

  @override
  String get backgroundServiceContent => '백그라운드 위치 감지 중...';

  @override
  String get backgroundServicePermissionError =>
      '백그라운드 서비스를 시작할 수 없습니다. 위치 권한이 부여되었는지 확인하세요';

  @override
  String get backgroundServiceAlwaysPermissionError =>
      '위치 권한이 충분하지 않습니다. 백그라운드 알림 기능이 올바르게 작동하도록 시스템 설정에서 \'항상 허용\' 권한을 부여하십시오.';

  @override
  String get backgroundServiceStarted => '백그라운드 위치 서비스가 시작되었습니다';

  @override
  String get backgroundServiceStopped => '백그라운드 위치 서비스가 중지되었습니다';

  @override
  String locationServiceAlertTitle(Object name) {
    return '알림 트리거됨: $name';
  }

  @override
  String arrivalAlertTitle(Object name) {
    return '📍 도착 알림: $name';
  }

  @override
  String get arrivalAlertBody => '목표 영역에 도착했습니다';

  @override
  String get backgroundChannelName => '백그라운드 실행 서비스';

  @override
  String get backgroundChannelDesc => '앱이 백그라운드에서 위치를 계속 감지하도록 유지';

  @override
  String get alertChannelName => '위치 도착 알림';

  @override
  String get alertChannelDesc => '목적지에 도착했을 때 알림을 제공';

  @override
  String get downloadChannelName => '지도 다운로드 진행률';

  @override
  String get downloadChannelDesc => '오프라인 지도 다운로드 진행률 표시';

  @override
  String downloadProgressTitle(int activeTasks) {
    return '오프라인 지도 다운로드 중 ($activeTasks 개 작업)';
  }

  @override
  String notificationDownloadFailedTitle(Object error) {
    return '다운로드 실패: $error';
  }

  @override
  String get notificationDownloadFailedBody => '네트워크를 확인하고 다시 시도하세요';
}
