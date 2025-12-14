import 'dart:io';
import 'dart:ui'; 
import 'package:triggeo/l10n/app_localizations.dart'; 

class ServiceStrings {
  // zh_CN, zh_Hant, en_US, de_DE, ja_JP, ko_KR
  static AppLocalizations _getLoc([String? priorityLang]) {
    final String systemLocale = (priorityLang ?? Platform.localeName).toLowerCase();
    Locale locale;

    // 1. Chinese
    if (systemLocale.startsWith('zh')) {
      // Traditional
      if (systemLocale.contains('tw') || systemLocale.contains('hk') || systemLocale.contains('hant')) {
        locale = const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'); 
      } else {
        // Simplified
        locale = const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans');
      }
    } 
    // 2. Japanese
    else if (systemLocale.startsWith('ja')) {
      locale = const Locale('ja');
    } 
    // 3. German
    else if (systemLocale.startsWith('de')) {
      locale = const Locale('de');
    } 
    // 4. Korean
    else if (systemLocale.startsWith('ko')) {
      locale = const Locale('ko');
    }
    // 5. Other
    else {
      locale = const Locale('en');
    }

    // flutter gen-l10n
    return lookupAppLocalizations(locale);
  }

  // --- Background Service Channel ---
  
  static String backgroundChannelName({String? languageCode}) {
    return _getLoc(languageCode).backgroundChannelName;
  }

  static String backgroundChannelDesc({String? languageCode}) {
    return _getLoc(languageCode).backgroundChannelDesc;
  }

  static String backgroundNotificationTitle({String? languageCode}) {
    return _getLoc(languageCode).backgroundServiceTitle;
  }

  static String backgroundNotificationContent({String? languageCode}) {
    return _getLoc(languageCode).backgroundServiceContent;
  }

  // --- Alert Channel ---

  static String alertChannelName({String? languageCode}) {
    return _getLoc(languageCode).alertChannelName;
  }

  static String alertChannelDesc({String? languageCode}) {
    return _getLoc(languageCode).alertChannelDesc;
  }

  // --- Download Channel ---

  static String downloadChannelName({String? languageCode}) {
    return _getLoc(languageCode).downloadChannelName;
  }

  static String downloadChannelDesc({String? languageCode}) {
    return _getLoc(languageCode).downloadChannelDesc;
  }

  // --- Specific Notifications ---

  static String arrivalAlertTitle(String name, {String? languageCode}) {
    return _getLoc(languageCode).arrivalAlertTitle(name);
  }

  static String arrivalAlertBody({String? languageCode}) {
    return _getLoc(languageCode).arrivalAlertBody;
  }

  static String downloadProgressTitle(int activeTasks, {String? languageCode}) {
    return _getLoc(languageCode).downloadProgressTitle(activeTasks);
  }
}