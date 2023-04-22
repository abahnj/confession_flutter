import 'dart:collection';

import 'package:confession_flutter/data/daos/prayers_dao.dart';
import 'package:confession_flutter/screens/prayers/prayers_page.dart';

import 'base_model.dart';

class PrayersPageViewModel extends BaseModel {
  PrayersPageViewModel({required PrayersDao dao}) : _dao = dao;

  final PrayersDao _dao;

  final List<ListItem> _prayers = [];

  UnmodifiableListView<ListItem> get prayers => UnmodifiableListView(_prayers);

  void getAllPrayers() {
    _dao.getAllPrayers().then((prayers) {
      for (var prayer in prayers) {
        if (prayer.id == 1) {
          _prayers.add(HeadingItem('Act of Contrition'));
        }

        if (prayer.id == 8) {
          _prayers.add(HeadingItem('Traditional Prayers'));
        }

        _prayers.add(
          PrayerItem(
            prayerName: prayer.prayerName,
            prayerText: prayer.prayerText,
            groupName: prayer.groupName,
            itemId: prayer.id,
          ),
        );
      }
      ;
      notifyListeners();
    });
  }
}
