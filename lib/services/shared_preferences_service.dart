import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences _preferences;
  final String themeKey = "Theme";

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //darkmode == true ; light false

  void saveThemePref(bool darkmode) async {
    await _preferences.setBool(themeKey, darkmode);
  }

  bool? getThemePref() {
    bool? theme = _preferences.getBool(themeKey);
    return theme;
  }
}
