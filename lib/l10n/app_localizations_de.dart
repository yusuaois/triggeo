// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get helloWorld => 'Hallo Welt';

  @override
  String get mapApiKeyTitle => 'API-Schlüssel';

  @override
  String get mapApiKeyHint => 'Bitte geben Sie Ihren API-Schlüssel ein';

  @override
  String get mapCancel => 'Abbrechen';

  @override
  String get mapConfirm => 'Bestätigen';

  @override
  String needApiKey(Object name) {
    return 'Bitte geben Sie den API-Schlüssel für $name ein';
  }

  @override
  String mapSearchFailed(Object error) {
    return 'Suche fehlgeschlagen: $error';
  }

  @override
  String mapGetLocationFailed(Object error) {
    return 'Standortabruf fehlgeschlagen: $error';
  }

  @override
  String get mapLocating => 'Ortung läuft...';

  @override
  String get mapSearchHint => 'Ort suchen';

  @override
  String get mapSearchEmptyError => 'Bitte geben Sie Suchbegriffe ein';

  @override
  String mapLocationFailed(Object error) {
    return 'Ortung fehlgeschlagen: $error';
  }

  @override
  String get mapLongPressHint =>
      'Langes Drücken auf eine beliebige Stelle auf der Karte, um eine Erinnerung hinzuzufügen';

  @override
  String get mapNoSearchResults => 'Keine Suchergebnisse gefunden';

  @override
  String settingsRingtoneSaved(Object ringtoneName) {
    return 'Klingelton gespeichert: $ringtoneName';
  }

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsThemeSection => 'Thema';

  @override
  String get settingsDynamic => 'Dynamische Farbe (Material You)';

  @override
  String get settingsSystemWallpaperColor =>
      'System-Hintergrundfarbe folgen (nur Android 12+)';

  @override
  String get settingsCustomThemeColor => 'Benutzerdefinierte Themenfarbe';

  @override
  String get settingsDarkMode => 'Dunkelmodus';

  @override
  String get settingsLightMode => 'Lichtmodus';

  @override
  String get settingsThemeSystem => 'System folgen';

  @override
  String get settingsThemeLight => 'Hell';

  @override
  String get settingsThemeDark => 'Dunkel';

  @override
  String get settingsReminderSection => 'Erinnerungseinstellungen';

  @override
  String get settingsReminderType => 'Erinnerungstyp';

  @override
  String get settingsReminderRingtone => 'Klingeln';

  @override
  String get settingsReminderVibration => 'Vibration';

  @override
  String get settingsReminderBoth => 'Klingeln und Vibration';

  @override
  String get settingsReminderVibrationNotSupport =>
      'Dieses Gerät unterstützt keine Vibration';

  @override
  String get settingsCustomRingtone =>
      'Benutzerdefinierter Benachrichtigungston';

  @override
  String get settingsPickRingtone =>
      'Tippen Sie, um eine Audiodatei auszuwählen';

  @override
  String settingsRintoneFileNotFound(Object filePath) {
    return 'Audiodatei unter Pfad $filePath nicht gefunden';
  }

  @override
  String settingsRintonePlayFiled(Object error) {
    return 'Wiedergabe der Audiodatei fehlgeschlagen, Fehler: $error';
  }

  @override
  String get settingsCustomVibrationPattern =>
      'Benutzerdefiniertes Vibrationsmuster';

  @override
  String get settingsEditVibrationPattern => 'Vibrationsmuster bearbeiten';

  @override
  String get settingsVibrationPatternHint =>
      'Beispiel: 0, 100, 50, 100, 500, 200';

  @override
  String get settingsVibrationPatternHelp =>
      'Geben Sie eine kommagetrennte Liste von Ganzzahlen ein: Verzögerung, Dauer, Verzögerung, Dauer... (Einheit: Millisekunden).';

  @override
  String settingsVibrationPatternSaved(Object pattern) {
    return 'Vibrationsmuster gespeichert: $pattern';
  }

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get settingsTestSetting => 'Aktuelle Einstellungen testen';

  @override
  String settingsDistanceFilter(Object distanceFilter) {
    return 'Standortaktualisierungsentfernung ($distanceFilter Meter)';
  }

  @override
  String get settingsDistanceFilterHint =>
      'Stellt die minimale Entfernung für Standortaktualisierungen (in Metern) ein. Kleinere Werte führen zu häufigeren Aktualisierungen, aber höherem Batterieverbrauch.';

  @override
  String get settingsLocationUpdate => 'Standortaktualisierungseinstellungen';

  @override
  String get settingsMapDataSection => 'Karte und Daten';

  @override
  String get settingsOfflineMap => 'Offline-Karten';

  @override
  String get settingsManageOfflineMap => 'Heruntergeladene Karten verwalten';

  @override
  String get settingsTileSource => 'Kartenquelle';

  @override
  String get settingsTileSourceRestart =>
      'Kartenquelle wurde gewechselt, tritt nach Neustart der App in Kraft';

  @override
  String get offlineMapAddedToQueue => 'Zur Download-Warteschlange hinzugefügt';

  @override
  String get offlineMapTitle => 'Offline-Kartenverwaltung';

  @override
  String get offlineMapTabNew => 'Neue Karten herunterladen';

  @override
  String get offlineMapTabTasks => 'Aufgaben und Heruntergeladenes';

  @override
  String get offlineMapLoadingData => 'Offline-Kartendaten werden geladen...';

  @override
  String offlineMapLoadFailed(Object error) {
    return 'Laden fehlgeschlagen: $error';
  }

  @override
  String get offlineMapSearchHint => 'Stadt suchen';

  @override
  String get offlineMapSearchButton => 'Suchen';

  @override
  String get offlineMapSearching => 'Wird gesucht...';

  @override
  String get offlineMapNoResults => 'Keine Suchergebnisse gefunden';

  @override
  String get offlineMapDownloadAction => 'Herunterladen';

  @override
  String offlineMapStatusDownloading(Object percent) {
    return 'Wird heruntergeladen $percent%';
  }

  @override
  String get offlineMapStatusCompleted => 'Abgeschlossen';

  @override
  String get offlineMapStatusFailed => 'Download fehlgeschlagen';

  @override
  String get offlineMapStatusPaused => 'Pausiert';

  @override
  String get offlineMapStatusCanceled => 'Abgebrochen';

  @override
  String get offlineMapStatusPending => 'Ausstehend...';

  @override
  String get offlineMapPauseAction => 'Pause';

  @override
  String get offlineMapResumeAction => 'Fortsetzen';

  @override
  String get offlineMapDeleteAction => 'Löschen';

  @override
  String get offlineMapNoTasks => 'Keine Aufgaben vorhanden';

  @override
  String get reminderNameRequired => 'Bitte geben Sie einen Namen ein';

  @override
  String reminderSaveFailed(Object error) {
    return 'Speichern fehlgeschlagen: $error';
  }

  @override
  String get reminderDetailTitle => 'Erinnerung einstellen';

  @override
  String get reminderNameLabel => 'Name des Ortes';

  @override
  String get reminderNameHint => 'Beispiel: Supermarkt, Arbeit';

  @override
  String reminderRadiusText(int radius) {
    return 'Erinnerungsradius: $radius Meter';
  }

  @override
  String get saveAction => 'Speichern';

  @override
  String get reminderListTitle => 'Meine Erinnerungen';

  @override
  String get reminderListEmpty => 'Keine Erinnerungen vorhanden';

  @override
  String reminderListItemSubtitle(int radius, Object lat, Object lon) {
    return 'Radius: ${radius}m\nKoordinaten: $lat, $lon';
  }

  @override
  String get reminderEditTitle => 'Erinnerung hinzufügen/bearbeiten';

  @override
  String reminderDetailInfo(Object lat, Object lon) {
    return 'Breitengrad: $lat\nLängengrad: $lon';
  }

  @override
  String get reminderCreated => 'Erinnerung wurde erstellt';

  @override
  String get reminderUpdated => 'Erinnerung wurde aktualisiert';

  @override
  String get cancelAction => 'Abbrechen';

  @override
  String get backgroundServiceTitle => 'Triggeo Hintergrundüberwachung';

  @override
  String get backgroundServiceContent =>
      'Hintergrund-Standortüberwachung läuft...';

  @override
  String get backgroundServicePermissionError =>
      'Hintergrunddienst konnte nicht gestartet werden, stellen Sie sicher, dass die Standortberechtigung erteilt wurde';

  @override
  String get backgroundServiceAlwaysPermissionError =>
      'Unzureichende Standortberechtigung. Bitte erteilen Sie in den Systemeinstellungen die Berechtigung „Immer zulassen“, um die ordnungsgemäße Funktion der Hintergrunderinnerung zu gewährleisten.';

  @override
  String get backgroundServiceStarted =>
      'Hintergrund-Standortdienst wurde gestartet';

  @override
  String get backgroundServiceStopped =>
      'Hintergrund-Standortdienst wurde beendet';

  @override
  String locationServiceAlertTitle(Object name) {
    return 'Erinnerung ausgelöst: $name';
  }

  @override
  String arrivalAlertTitle(Object name) {
    return '📍 Ankunftserinnerung: $name';
  }

  @override
  String get arrivalAlertBody => 'Sie haben das Zielgebiet erreicht';

  @override
  String get backgroundChannelName => 'Hintergrund-Dienst';

  @override
  String get backgroundChannelDesc =>
      'Hält die App im Hintergrund, um den Standort zu überwachen';

  @override
  String get alertChannelName => 'Standort-Ankunftserinnerung';

  @override
  String get alertChannelDesc =>
      'Erinnert Sie, wenn Sie am Zielort angekommen sind';

  @override
  String get downloadChannelName => 'Karten-Download-Fortschritt';

  @override
  String get downloadChannelDesc =>
      'Zeigt den Fortschritt des Offline-Karten-Downloads an';

  @override
  String downloadProgressTitle(int activeTasks) {
    return 'Offline-Karten werden heruntergeladen ($activeTasks Aufgaben)';
  }

  @override
  String notificationDownloadFailedTitle(Object error) {
    return 'Download fehlgeschlagen: $error';
  }

  @override
  String get notificationDownloadFailedBody =>
      'Bitte überprüfen Sie die Netzwerkverbindung und versuchen Sie es erneut';
}
