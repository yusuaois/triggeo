import 'dart:io';
import 'dart:ui'; 
import 'package:triggeo/l10n/app_localizations.dart'; 

class ServiceStrings {
  static AppLocalizations _getLoc([String? priorityLang]) {
    Locale locale;

    if (priorityLang != null && (priorityLang.startsWith('zh') || priorityLang.startsWith('en'))) {
      locale = Locale(priorityLang.startsWith('zh') ? 'zh' : 'en');
    } 
    else {
      final String systemLocale = Platform.localeName; // 例如 zh_CN, en_US
      if (systemLocale.startsWith('zh')) {
        locale = const Locale('zh');
      } else {
        locale = const Locale('en');
      }
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