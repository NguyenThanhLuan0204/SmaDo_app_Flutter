import 'dart:collection';

import 'package:fit/appLanguage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'de_DE.dart';
import 'en_US.dart';
import 'hi_IN.dart';
import 'vi_VN.dart';

class TranslationService extends Translations {
  static String? lang = LocalStorage().getString('lang');
  static final locale = _getLocaleFromLanguage(langCode: lang ?? 'en');

  // ignore: prefer_const_constructors
  static final fallbackLocale = Locale('en', 'US');

// language code của những locale được support
  static final langCodes = [
    'en',
    'hi',
    'de',
    'vi',
  ];

// các Locale được support
  static final locales = [
    const Locale('en', 'US'),
    const Locale('hi', 'IN'),
    const Locale('de', 'DE'),
    const Locale('vi', 'VN'),
  ];
  static final langs = LinkedHashMap.from({
    'en': 'English',
    'hi': 'Hindi',
    'de': 'German',
    'vi': 'Tiếng Việt',
  });

  static void changeLocale(String langCode) {
    LocalStorage().setString('lang', langCode);
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale!);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'hi_IN': hi_IN,
        'de_DE': de_DE,
        'vi_VN': vi_VN,
      };

  static Locale? _getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale!.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return locales[0];
  }
}
