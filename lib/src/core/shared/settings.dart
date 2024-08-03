import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_utils/src/core/shared/device.dart';
import 'package:flutter_utils/src/core/shared/environment.dart';
import 'package:flutter_utils/src/services/storage/shared_preferences_service.dart';
import 'package:flutter_utils/src/services/storage/storage.dart';
import 'package:json_theme/json_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class Settings with ChangeNotifier {
  late ThemeMode _themeMode;
  late ThemeData _themeData;
  String? _appLanguage;
  String? _countryLanguage;

  static final Settings _driver = Settings._internal();

  factory Settings() {
    return _driver;
  }

  Settings._internal();

  // Allow Widgets to read the user's preferred ThemeMode.
  ThemeMode get themeMode => _themeMode;
  ThemeData get themeData {
    _themeData.textTheme.apply(fontFamily: "Poppins-Regular");
    return _themeData;
  }

  /// initial config boot
  Future<void> loadSettings() async {
    await updateTheme(null);
    await setEnvironment();
    setAppLanguage(Device.getSystemLocale());
  }

  Future<void> updateTheme(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) {
      _themeMode = ThemeMode.system;
    }
    await updateThemeMode(_themeMode);
    await updateThemeData(_themeMode);
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) {
      _themeMode = ThemeMode.system;
    }
    if (newThemeMode == _themeMode) return;
    _themeMode = newThemeMode!;
  }

  Future<void> updateThemeData(ThemeMode newThemeMode) async {
    _themeData = await _loadThemeData(newThemeMode);
  }

  String _getThemePath(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 'assets/themes/light_theme.json';
      // case ThemeMode.dark:
      //   return 'assets/themes/dark_theme.json';
      default:
        return 'assets/themes/light_theme.json';
    }
  }

  Future<ThemeData> _loadThemeData(ThemeMode themeMode) async {
    String themePath = _getThemePath(themeMode);
    final themeDataStr = await rootBundle.loadString(themePath);
    final themeDataJson = jsonDecode(themeDataStr);
    return ThemeDecoder.decodeThemeData(themeDataJson)!;
  }

  Future<void> setEnvironment() async {
    String environment = dotenv.env['APP_ENVIRONMENT'] ?? "DEV";
    String appVersion = dotenv.env['APP_VERSION'] ?? "1.0.0";
    Environment.setType(environment);
    Environment.setAppVersion(appVersion);
  }

  void setAppLanguage(String language) {
    _appLanguage = language;
  }

  void setCountryLanguage(String countryCode) {
    _countryLanguage = countryCode;
  }

  Locale get appLocale => Locale.fromSubtags(
      languageCode: _appLanguage!, countryCode: _countryLanguage);

  Future<void> changeLanguagePreference(
      {String? language, String? countryLanguage}) async {
    language ??= Device.getSystemLocale();
    countryLanguage ??= Device.getSystemLocaleCountry();
    Settings().setAppLanguage(language);
    Settings().setCountryLanguage(countryLanguage);
    storeLanguagePreferences();
    notifyListeners();
  }

  /// Store the app language in the local preferences and notify Settings listeners
  Future<void> storeLanguagePreferences(
      {String? language, String? countryLanguage}) async {
    SharedPreferences sharedPreferencesInstance =
        await SharedPreferences.getInstance();
    Storage sharedPreferences =
        SharedPreferencesService(sharedPreferences: sharedPreferencesInstance);
    sharedPreferences.write(
        key: SharedPreferencesService.keyLanguage, data: language);
    sharedPreferences.write(
      key: SharedPreferencesService.keyCountryLanguage,
      data: countryLanguage,
    );
    notifyListeners();
  }

  static Future<String> getStoredLanguage() async {
    SharedPreferences sharedPreferencesInstance =
        await SharedPreferences.getInstance();
    Storage sharedPreferences =
        SharedPreferencesService(sharedPreferences: sharedPreferencesInstance);
    String? language =
        sharedPreferences.read(key: SharedPreferencesService.keyLanguage);
    return language ??= Device.getSystemLocale();
  }

  static Future<String> getStoredLanguageCountry() async {
    SharedPreferences sharedPreferencesInstance =
        await SharedPreferences.getInstance();
    Storage sharedPreferences =
        SharedPreferencesService(sharedPreferences: sharedPreferencesInstance);
    String? languageCountry = sharedPreferences.read(
        key: SharedPreferencesService.keyCountryLanguage);
    return languageCountry ??= Device.getSystemLocaleCountry();
  }
}
