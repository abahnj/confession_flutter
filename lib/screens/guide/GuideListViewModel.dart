import 'dart:collection';

import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/data/daos/guides_dao.dart';
import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/viewmodels/base_model.dart';

class GuideListViewModel extends BaseModel {
  GuideListViewModel({GuidesDao dao, User user}) : _dao = dao;

  final GuidesDao _dao;

  List<Guide> _guides = [];

  UnmodifiableListView<Guide> get guides => UnmodifiableListView(_guides);

  void getGuidesForId(int guideId) {
    _dao.getGuidesForId(guideId).then((guides) {
      _guides = guides;
      notifyListeners();
    });
  }
}
