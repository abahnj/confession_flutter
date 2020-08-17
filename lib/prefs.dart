import 'package:confession_flutter/data/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class PrefsBlocError extends Error {
  final String message;

  PrefsBlocError(this.message);
}

class PrefsNotifier with ChangeNotifier {
  User _user = User.initial();

  PrefsNotifier() {
    _loadSharedPrefs();
  }

  User get user => _user;

  set lastConfession(String lastConfession) =>
      _setLastConfession(lastConfession);

  void setUserGender(Gender gender) {
    if (gender == _user.gender) return;
    _user.gender = gender;
    _saveNewPrefs();
    notifyListeners();
  }

  set userAge(Age age) {
    if (age == _user.age) return;
    _user.age = age;
    _saveNewPrefs();
    notifyListeners();
  }

  Future<void> _setLastConfession(String date) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString(LAST_CONFESSION, date);
    _user.lastConfession = date;
    notifyListeners();
  }

  void setUserVocation(Vocation vocation) {
    if (vocation == _user.vocation) return;
    _user.vocation = vocation;
    _saveNewPrefs();
    notifyListeners();
  }

  Future<void> _loadSharedPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();

    var genderPref = Gender.values[(sharedPrefs.getInt(GENDER_PREF)) ?? 0];
    var vocationPref =
        Vocation.values[(sharedPrefs.getInt(VOCATION_PREF)) ?? 0];
    var agePref = Age.values[(sharedPrefs.getInt(AGE_PREF)) ?? 0];
    var lastConfessionPref =
        sharedPrefs.getString(LAST_CONFESSION) ?? DateTime.now().toString();

    _user = User(
        vocation: vocationPref,
        gender: genderPref,
        age: agePref,
        lastConfession: lastConfessionPref);

    notifyListeners();
  }

  Future<void> _saveNewPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setInt(GENDER_PREF, _user.gender.index);
    await sharedPrefs.setInt(AGE_PREF, _user.age.index);
    await sharedPrefs.setInt(VOCATION_PREF, _user.vocation.index);
    await sharedPrefs.setString(LAST_CONFESSION, _user.lastConfession);
  }
}
