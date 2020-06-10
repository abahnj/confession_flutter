import 'package:confession_flutter/data/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsBlocError extends Error {
  final String message;

  PrefsBlocError(this.message);
}

class PrefsState {
  final ThemeMode userThemeMode;
  final User user;

  PrefsState({this.user, this.userThemeMode = ThemeMode.system});
}

class ThemeState {
  final ThemeMode userThemeMode;

  ThemeState({this.userThemeMode = ThemeMode.system});
}

class ThemeStyle with ChangeNotifier {
  static const String THEME_PREF = 'AppTheme';
  PrefsState _currentPrefs = PrefsState();
  ThemeMode _userThemeMode;

  ThemeStyle() {
    _loadSharedPrefs();
  }

  ThemeMode get userThemeMode {
    return _userThemeMode;
  }

  set userThemeMode(ThemeMode newValue) {
    if (newValue == _userThemeMode) return;
    _userThemeMode = newValue;

    _currentPrefs = PrefsState(userThemeMode: newValue);
    notifyListeners();
    _saveNewPrefs();
  }

  Future<void> _loadSharedPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();

    var userThemeMode = ThemeMode.values[(sharedPrefs.getInt(THEME_PREF)) ?? 0];
    _userThemeMode = userThemeMode;

    _currentPrefs = PrefsState(
      userThemeMode: userThemeMode,
    );

    notifyListeners();
  }

  Future<void> _saveNewPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setInt(THEME_PREF, _userThemeMode.index);
  }
}

class PrefsNotifier with ChangeNotifier {
  PrefsState _currentPrefs = PrefsState();

  PrefsNotifier() {
    _loadSharedPrefs();
  }

  static const String GENDER_PREF = 'GENDER_PREF';
  static const String VOCATION_PREF = 'VOCATION_PREF';
  static const String AGE_PREF = 'AGE_PREF';

  User get user => _currentPrefs.user;

  set userGender(Gender gender) {
    if (gender == _currentPrefs.user.gender) return;
    _currentPrefs = PrefsState(
      user: _currentPrefs.user.copyWith(gender: gender),
    );
    notifyListeners();
    _saveNewPrefs();
  }

  set userAge(Age age) {
    if (age == _currentPrefs.user.age) return;
    _currentPrefs = PrefsState(
      user: _currentPrefs.user.copyWith(age: age),
    );
    notifyListeners();
    _saveNewPrefs();
  }

  set userVocation(Vocation vocation) {
    if (vocation == _currentPrefs.user.vocation) return;
    _currentPrefs = PrefsState(
      user: _currentPrefs.user.copyWith(vocation: vocation),
    );
    notifyListeners();
    _saveNewPrefs();
  }

  Future<void> _loadSharedPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();

    var genderPref = Gender.values[(sharedPrefs.getInt(GENDER_PREF)) ?? 0];
    var vocationPref =
        Vocation.values[(sharedPrefs.getInt(VOCATION_PREF)) ?? 3];
    var agePref = Age.values[(sharedPrefs.getInt(AGE_PREF)) ?? 0];
    _currentPrefs = PrefsState(
      user: User(vocation: vocationPref, gender: genderPref, age: agePref),
    );

    notifyListeners();
  }

  Future<void> _saveNewPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setInt(GENDER_PREF, _currentPrefs.user.gender.index);
    await sharedPrefs.setInt(AGE_PREF, _currentPrefs.user.age.index);
    await sharedPrefs.setInt(VOCATION_PREF, _currentPrefs.user.vocation.index);
  }
}
