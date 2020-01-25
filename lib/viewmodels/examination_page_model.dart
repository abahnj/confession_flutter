import 'dart:collection';

import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/data/daos/examinations_dao.dart';
import 'package:confession_flutter/viewmodels/base_model.dart';

class ExaminationPageViewModel extends BaseModel {
  ExaminationPageViewModel(ExaminationsDao dao) : _dao = dao;

  final ExaminationsDao _dao;

  List<Examination> _examinations = [];

  UnmodifiableListView<Examination> get examinations =>
      UnmodifiableListView(_examinations);

  void getExaminationsForId(int commandmentId) {
    _dao.getExaminationsForId(commandmentId).then((examinations) {
      _examinations = examinations;
      notifyListeners();
    });
  }
}
