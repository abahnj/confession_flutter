import 'dart:collection';

import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/data/daos/commandments_dao.dart';
import 'package:confession_flutter/data/user.dart';
import 'package:stacked/stacked.dart';

class CommandmentsPageViewModel extends BaseViewModel {
  CommandmentsPageViewModel({required CommandmentsDao dao}) : _dao = dao;

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

  List<Commandment> filterCommandments(User user) {
    if (user.age == Age.child) {
      return commandments
          .where((commandment) => commandment.id == 11 || commandment.id == 14)
          .toList();
    } else if (user.vocation == Vocation.priest ||
        user.vocation == Vocation.religious) {
      return commandments.where((commandment) => commandment.id > 10).toList();
    } else {
      return commandments.where((commandment) => commandment.id <= 10).toList();
    }
  }
}
