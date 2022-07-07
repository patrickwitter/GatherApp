import 'package:flutter/material.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/services/shared_preferences_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class AppThemeViewModel extends BaseViewModel {
  ThemeMode _themeMode = ThemeMode.system;
  SharedPreferencesService service = locator<SharedPreferencesService>();
  get themeMode {
    bool? themepref = service.getThemePref();

    if (themepref == null) {
      service.saveThemePref(isDarkMode);
    } else if (themepref) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    return _themeMode;
  }

  bool get isDarkMode => ThemeMode.dark == _themeMode;

  void toogleTheme({required bool darkMode}) {
    _themeMode = darkMode ? ThemeMode.dark : ThemeMode.light;
    service.saveThemePref(darkMode);
    notifyListeners();
  }

  static void init() {}
}
