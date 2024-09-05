import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/enums/preferences_types.dart';
import '../cache/locale_manager.dart';

class ThemeService {
  LocaleManager? localService = LocaleManager.instance;

  bool isSavedDarkMode() {
    return localService!.getBoolValue(PreferencesTypes.theme);
  }

  ThemeMode getTheme() {
    return isSavedDarkMode() == true ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> setTheme(bool value) async {
    await localService!.setBoolValue(PreferencesTypes.theme, value);
  }

  Future<void> changeTheme() async {
    Get.changeThemeMode(isSavedDarkMode() == false ? ThemeMode.dark : ThemeMode.light);
    await setTheme(!isSavedDarkMode());
  }
}
