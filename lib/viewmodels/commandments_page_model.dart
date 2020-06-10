import 'dart:collection';

import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/data/daos/commandments_dao.dart';
import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/viewmodels/base_model.dart';

class CommandmentsPageViewModel extends BaseModel {
  CommandmentsPageViewModel({CommandmentsDao dao, User user})
      : _dao = dao,
        _user = user;

  final CommandmentsDao _dao;
  final User _user;

  List<Commandment> _commandments = [];

  UnmodifiableListView<Commandment> get commandments =>
      UnmodifiableListView(_commandments);

  void getAllCommandment() {
    print('Im called');
    _dao.getAllCommandments().then((commandments) {
      _commandments = commandments;
      notifyListeners();
    });
  }

  void getCommandmentsForUser(_user) {}
}
