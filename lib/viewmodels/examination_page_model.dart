import 'dart:collection';

import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/data/commandments_dao.dart';
import 'package:confession_flutter/viewmodels/base_model.dart';

class ExaminationPageViewModel extends BaseModel {
  ExaminationPageViewModel(CommandmentsDao dao) : _dao = dao;

  final CommandmentsDao _dao;

  List<Commandment> _commandments = [];

  UnmodifiableListView<Commandment> get commandments =>
      UnmodifiableListView(_commandments);

  void getAllCommandment() {
    _dao.getAllCommandments().then((commandments) {
      _commandments = commandments;
      notifyListeners();
    });
  }
}
