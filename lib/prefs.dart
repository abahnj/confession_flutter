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

  const PrefsState(
      {this.user = const User(), this.userThemeMode = ThemeMode.system});
}

class PrefsNotifier with ChangeNotifier {
  PrefsState _currentPrefs = PrefsState();

  PrefsNotifier() {
    _loadSharedPrefs();
  }

  static const String THEME_PREF = 'AppTheme';
  static const String GENDER_PREF = 'GENDER_PREF';
  static const String VOCATION_PREF = 'VOCATION_PREF';
  static const String AGE_PREF = 'AGE_PREF';

  ThemeMode get userThemeMode => _currentPrefs.userThemeMode;
  User get user => _currentPrefs.user;

  set userThemeMode(ThemeMode newValue) {
    if (newValue == _currentPrefs.userThemeMode) return;
    _currentPrefs = PrefsState(userThemeMode: newValue);
    notifyListeners();
    _saveNewPrefs();
  }

  set userGender(Gender gender) {
    if (gender == _currentPrefs.user.gender) return;
    _currentPrefs = PrefsState(
      user: _currentPrefs.user.copyWith(gender: gender),
    );
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

    var userThemeMode = ThemeMode.values[(sharedPrefs.getInt(THEME_PREF)) ?? 0];
    var genderPref = Gender.values[(sharedPrefs.getInt(GENDER_PREF)) ?? 0];
    var vocationPref =
        Vocation.values[(sharedPrefs.getInt(VOCATION_PREF)) ?? 3];
    var agePref = Age.values[(sharedPrefs.getInt(AGE_PREF)) ?? 0];
    _currentPrefs = PrefsState(
      userThemeMode: userThemeMode,
      user: User(vocation: vocationPref, gender: genderPref, age: agePref),
    );

    print(_currentPrefs.user.toString());
    notifyListeners();
  }

  Future<void> _saveNewPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setInt(THEME_PREF, _currentPrefs.userThemeMode.index);
    await sharedPrefs.setInt(GENDER_PREF, _currentPrefs.user.gender.index);
    await sharedPrefs.setInt(AGE_PREF, _currentPrefs.user.age.index);
    await sharedPrefs.setInt(VOCATION_PREF, _currentPrefs.user.vocation.index);
  }
}
