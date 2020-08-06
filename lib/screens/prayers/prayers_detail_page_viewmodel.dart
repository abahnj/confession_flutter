import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/data/daos/prayers_dao.dart';
import 'package:confession_flutter/viewmodels/base_model.dart';

class PrayersDetailPageViewModel extends BaseModel {
  PrayersDetailPageViewModel({PrayersDao dao}) : _dao = dao;

  final PrayersDao _dao;

  Prayer _prayer;

  Prayer get prayer => _prayer;

  void getPrayerForId(int id) {
    _dao.getPrayerForId(id).then((prayer) {
      _prayer = prayer;
      notifyListeners();
    });
  }
}
