import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModeOption { light, dark, system }

class Preferences with ChangeNotifier {
  static const String _themeModeKey = 'themeMode';

  ThemeModeOption _themeModeOption = ThemeModeOption.system;

  Preferences() {
    _loadThemeMode();
  }

  ThemeModeOption get themeMode {
    return _themeModeOption;
  }

  set themeMode(ThemeModeOption value) {
    _themeModeOption = value;
    _saveThemeMode(); // Save the selected theme mode
    notifyListeners();
  }

  ThemeMode getThemeMode() {
    switch (_themeModeOption) {
      case ThemeModeOption.light:
        return ThemeMode.light;
      case ThemeModeOption.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> _saveThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_themeModeKey, _themeModeOption.toString());
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMode = prefs.getString(_themeModeKey);
    if (savedMode != null) {
      _themeModeOption = ThemeModeOption.values
          .firstWhere((mode) => mode.toString() == savedMode);
    }
  }
}
