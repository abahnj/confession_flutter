import 'dart:collection';

import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/data/daos/examinations_dao.dart';
import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/viewmodels/base_model.dart';

class ExaminationPageViewModel extends BaseModel {
  ExaminationPageViewModel({ExaminationsDao dao, User user})
      : _dao = dao,
        _user = user;

  final ExaminationsDao _dao;
  final User _user;

  List<Examination> _examinations = [];

  UnmodifiableListView<Examination> get examinations =>
      UnmodifiableListView(_examinations);

  void getExaminationsForId(int commandmentId) {
    _dao.getExaminationsForId(commandmentId).then((examinations) {
      _examinations = examinations;
      notifyListeners();
    });
  }

  void getExaminationsForUserAndId(int commandmentId) {
    _dao.getExaminationsForUserAndId(commandmentId, _user).then((examinations) {
      _examinations = examinations;
      notifyListeners();
    });
  }
}
