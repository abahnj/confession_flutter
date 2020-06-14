import 'package:confession_flutter/data/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class PrefsBlocError extends Error {
  final String message;

  PrefsBlocError(this.message);
}

class PrefsState {
  final User user;

  PrefsState({this.user});
}

class PrefsNotifier with ChangeNotifier {
  User _user = User.initial();

  PrefsNotifier() {
    _loadSharedPrefs();
  }

  User get user => _user;

  void setUserGender(Gender gender) {
    if (gender == _user.gender) return;
    _user = _user.copyWith(gender: gender);
    notifyListeners();
    _saveNewPrefs();
  }

  set userAge(Age age) {
    if (age == _user.age) return;
    _user = _user.copyWith(age: age);
    notifyListeners();
    _saveNewPrefs();
  }

  void setUserVocation(Vocation vocation) {
    if (vocation == _user.vocation) return;
    _user = _user.copyWith(vocation: vocation);
    notifyListeners();
    _saveNewPrefs();
  }

  Future<void> _loadSharedPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();

    var genderPref = Gender.values[(sharedPrefs.getInt(GENDER_PREF)) ?? 0];
    var vocationPref =
        Vocation.values[(sharedPrefs.getInt(VOCATION_PREF)) ?? 0];
    var agePref = Age.values[(sharedPrefs.getInt(AGE_PREF)) ?? 0];

    _user = User(vocation: vocationPref, gender: genderPref, age: agePref);

    notifyListeners();
  }

  Future<void> _saveNewPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setInt(GENDER_PREF, _user.gender.index);
    await sharedPrefs.setInt(AGE_PREF, _user.age.index);
    await sharedPrefs.setInt(VOCATION_PREF, _user.vocation.index);
  }
}
