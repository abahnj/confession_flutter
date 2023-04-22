import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeState {
  final ThemeMode userThemeMode;

  ThemeState({this.userThemeMode = ThemeMode.system});
}

class ThemeStyle with ChangeNotifier {
  static const String THEME_PREF = 'AppTheme';
  ThemeMode _userThemeMode = ThemeMode.light;

  ThemeStyle() {
    _loadSharedPrefs();
  }

  ThemeMode get userThemeMode {
    return _userThemeMode;
  }

  set userThemeMode(ThemeMode newValue) {
    if (newValue == _userThemeMode) return;
    _userThemeMode = newValue;

    notifyListeners();
    _saveNewPrefs();
  }

  Future<void> _loadSharedPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();

    var userThemeMode = ThemeMode.values[(sharedPrefs.getInt(THEME_PREF)) ?? 0];
    _userThemeMode = userThemeMode;

    notifyListeners();
  }

  Future<void> _saveNewPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setInt(THEME_PREF, _userThemeMode.index);
  }
}
