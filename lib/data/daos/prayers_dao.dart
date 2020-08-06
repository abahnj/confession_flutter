import 'package:confession_flutter/data/app_database.dart';
import 'package:moor/moor.dart';

part 'prayers_dao.g.dart';

class Prayers extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();

  TextColumn get prayerName => text().named('PRAYERNAME')();

  TextColumn get prayerText => text().named('PRAYERTEXT')();

  TextColumn get groupName => text().named('GROUPNAME')();

  @override
  String get tableName => 'PRAYERS';
}

@UseDao(tables: [Prayers])
class PrayersDao extends DatabaseAccessor<AppDatabase> with _$PrayersDaoMixin {
  PrayersDao(AppDatabase db) : super(db);

  Future<List<Prayer>> getAllPrayers() => select(prayers).get();

  Future<Prayer> getPrayerForId(int id) =>
      (select(prayers)..where((tbl) => tbl.id.equals(id))).getSingle();
}
