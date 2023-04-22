import 'dart:math';

import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/data/daos/prayers_dao.dart';
import 'package:confession_flutter/viewmodels/base_model.dart';

class PrayersDetailPageViewModel extends BaseModel {
  PrayersDetailPageViewModel({required PrayersDao dao}) : _dao = dao;

  final PrayersDao _dao;

  late Prayer _prayer;

  late Inspiration _inspiration;

  Prayer get prayer => _prayer;

  Inspiration get randomInspiration => _inspiration;

  void getPrayerForId(int id) {
    _dao.getPrayerForId(id).then((prayer) {
      _prayer = prayer;
      notifyListeners();
    });
  }

  void getRandomInspiration() {
    var inspirationId = Random().nextInt(18) + 1;
    _dao.getInspirationForId(inspirationId).then((value) {
      _inspiration = value;
      notifyListeners();
    });
  }

  void finishConfession() {
    _dao.resetExaminationsCount();
  }
}
