import 'dart:collection';
import 'dart:developer';

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
  int nextCommandmentId;
  int previousCommandmentId;

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
    _dao
        .getExaminationsForUserAndId(commandmentId, _user)
        .listen((examinations) {
      _examinations = examinations;
      notifyListeners();
    });
  }

  void setNeighbouringIds(int commandmentId) {
    var commandments = _user.returnCommandmentsForUser();
    nextCommandmentId = commandments[
        (commandments.indexOf(commandmentId) + 1) % commandments.length];

    previousCommandmentId = commandments[
        (commandments.indexOf(commandmentId) - 1) % commandments.length];
  }

  String getCommandmentTitle(int commandmentId) {
    var titles = {
      1: '1st Commandment',
      2: '2nd Commandment',
      3: '3rd Commandment',
      4: '4th Commandment',
      5: '5th Commandment',
      6: '6th Commandment',
      7: '7th Commandment',
      8: '8th Commandment',
      9: '9th Commandment',
      10: '10th Commandment',
      11: 'Responsibilities to God',
      12: 'Responsibilities to Promises and Vows',
      13: 'Responsibilities to My Ministry',
      14: 'Responsibilities to Others',
      15: 'Responsibilities to Society',
    };

    return titles[commandmentId];
  }

  void updateCountForExamination(Examination examination) {
    var modifiedCount =
        _dao.updateCountForExamination(examination).then((value) {
      log(value.toString());
      notifyListeners();
    });
  }
}
