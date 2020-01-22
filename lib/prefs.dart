import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsBlocError extends Error {
  final String message;

  PrefsBlocError(this.message);
}

class PrefsState {
  final ThemeMode userThemeMode;

  const PrefsState({this.userThemeMode = ThemeMode.system});
}

class PrefsNotifier with ChangeNotifier {
  PrefsState _currentPrefs = PrefsState();

  PrefsNotifier() {
    _loadSharedPrefs();
  }

  static const String THEME_PREF = 'AppTheme';

  ThemeMode get userThemeMode => _currentPrefs.userThemeMode;

  set userThemeMode(ThemeMode newValue) {
    if (newValue == _currentPrefs.userThemeMode) return;
    _currentPrefs = PrefsState(userThemeMode: newValue);
    notifyListeners();
    _saveNewPrefs();
  }

  Future<void> _loadSharedPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    print(sharedPrefs.getInt(THEME_PREF));
    var userThemeMode = ThemeMode.values[(sharedPrefs.getInt(THEME_PREF)) ?? 0];
    _currentPrefs = PrefsState(userThemeMode: userThemeMode);
    notifyListeners();
  }

  Future<void> _saveNewPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    // TODO(efortuna): Why is this a shared preferences variable?
    await sharedPrefs.setInt(THEME_PREF, _currentPrefs.userThemeMode.index);
  }
}
