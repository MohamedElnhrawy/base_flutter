import 'package:base_flutter/source/app/app_preferences.dart';
import 'package:base_flutter/source/app/dependency_injection.dart';
import 'package:flutter/material.dart';

enum LanguageType { ENGLISH, ARABIC }

const String ARABIC = 'ar';
const String ENGLISH = 'en';
const String ASSETS_PATH_LOCALIZATIONS = 'assets/translations';
const Locale ARABIC_Locale = Locale('ar', 'SA');
const Locale ENGLISH_Locale = Locale('en', 'US');

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ARABIC:
        return ARABIC;
      case LanguageType.ENGLISH:
        return ENGLISH;
    }
  }
}

class LocalizationManager {
  AppPreferences _appPreferences = diInstance<AppPreferences>();

  Locale? _locale;
  Locale? get locale => _locale;

  static bool isArabic = true;

  Future changeLanguage(LanguageType languageType) async {
    await _appPreferences.setLanguageChanges(languageType);
  }

  Future init() async {
    _locale = await _appPreferences.getLocale();
    isArabic = _locale!.languageCode == LanguageType.ARABIC.getValue();
  }
}
