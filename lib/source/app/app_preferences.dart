import 'package:base_flutter/source/presentation/resources/langauge_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREF_KEY_LANGUAGE = 'PREF_KEY_LANGUAGE';
const String PREF_KEY_ACCESS_TOKEN = 'PREF_KEY_ACCESS_TOKEN';
const String PREF_KEY_REFRESH_TOKEN = 'PREF_KEY_REFRESH_TOKEN';
const String PREF_KEY_ACCESS_IS_GUEST = 'PREF_KEY_ACCESS_IS_GUEST';
const String PREF_KEY_CUSTOMER_NAME = 'PREF_KEY_CUSTOMER_NAME';
const String PREF_KEY_CUSTOMER_PHONE = 'PREF_KEY_CUSTOMER_PHONE';
const String PREF_KEY_ACCESS_TOKEN_EXPIRY = 'PREF_KEY_ACCESS_TOKEN_EXPIRY';
const String PREF_KEY_REFRESH_TOKEN_EXPIRY = 'PREF_KEY_REFRESH_TOKEN_EXPIRY';
const String PREF_KEY_ON_BOARDING = 'PREF_KEY_ON_BOARDING';

class AppPreferences {
  SharedPreferences _preferences;

  AppPreferences(this._preferences);
}

extension LanguageAppPreferences on AppPreferences {
  Future<String> getAppLanguage() async {
    String? language = _preferences.getString(PREF_KEY_LANGUAGE);
    if (language != null && language.isNotEmpty) {
      return language;
    }
    return LanguageType.ARABIC.getValue();
  }

  Future<void> setLanguageChanges(LanguageType languageType) async {
    _preferences.setString(PREF_KEY_LANGUAGE, languageType.getValue());
  }

  Future<Locale> getLocale() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      return ARABIC_Locale;
    } else {
      return ENGLISH_Locale;
    }
  }
}

extension CustomerDataPreferences on AppPreferences {
  Future<bool> getIsGuest() async {
    bool? isGuest = _preferences.getBool(PREF_KEY_ACCESS_IS_GUEST);
    if (isGuest != null) {
      return isGuest;
    }
    return true;
  }

  Future<void> setIsGuest(bool isGuest) async {
    _preferences.setBool(PREF_KEY_ACCESS_IS_GUEST, isGuest);
  }

  Future<String> getCustomerName() async {
    String? customerName = _preferences.getString(PREF_KEY_CUSTOMER_NAME);
    if (customerName != null) {
      return customerName;
    }
    return '';
  }

  Future setCustomerName(String customerName) async {
    _preferences.setString(PREF_KEY_CUSTOMER_NAME, customerName);
  }

  Future<String> getCustomerPhoneNumber() async {
    String? customerPhone = _preferences.getString(PREF_KEY_CUSTOMER_PHONE);
    if (customerPhone != null) {
      return customerPhone;
    }
    return '';
  }

  Future setCustomerPhoneNumber(String customerPhone) async {
    _preferences.setString(PREF_KEY_CUSTOMER_PHONE, customerPhone);
  }
}

extension AccessTokenPreferences on AppPreferences {
  Future<String> getAccessToken() async {
    String? accessToken = _preferences.getString(PREF_KEY_ACCESS_TOKEN);
    if (accessToken != null && accessToken.isNotEmpty) {
      return accessToken;
    }
    return '';
  }

  Future<void> setAccessToken(String accessToken) async {
    _preferences.setString(PREF_KEY_ACCESS_TOKEN, accessToken);
  }

  Future<int> getAccessTokenExpiry() async {
    int? accessTokenExpiry = _preferences.getInt(PREF_KEY_ACCESS_TOKEN_EXPIRY);
    if (accessTokenExpiry != null) {
      return accessTokenExpiry;
    }
    return 0;
  }

  Future<void> setAccessTokenExpiry(int accessTokenExpiry) async {
    _preferences.setInt(PREF_KEY_ACCESS_TOKEN_EXPIRY, accessTokenExpiry);
  }
}

extension RefreshTokenPreferences on AppPreferences {
  Future<String> getRefreshToken() async {
    String? accessToken = _preferences.getString(PREF_KEY_REFRESH_TOKEN);
    if (accessToken != null && accessToken.isNotEmpty) {
      return accessToken;
    }
    return '';
  }

  Future<void> setRefreshToken(String accessToken) async {
    _preferences.setString(PREF_KEY_REFRESH_TOKEN, accessToken);
  }

  Future<int> getRefreshTokenExpiry() async {
    int? accessTokenExpiry = _preferences.getInt(PREF_KEY_REFRESH_TOKEN_EXPIRY);
    if (accessTokenExpiry != null) {
      return accessTokenExpiry;
    }
    return 0;
  }

  Future<void> setRefreshTokenExpiry(int accessTokenExpiry) async {
    _preferences.setInt(PREF_KEY_REFRESH_TOKEN_EXPIRY, accessTokenExpiry);
  }
}

// _isOnBoardingShown
extension OnBoardingPreferences on AppPreferences {
  Future<bool> isOnBoardingShown() async {
    bool? status = _preferences.getBool(PREF_KEY_ON_BOARDING);
    if (status != null) {
      return status;
    }
    return false;
  }

  Future<void> setOnBoardingShown() async {
    _preferences.setBool(PREF_KEY_ON_BOARDING, true);
  }
}
