import 'package:confession_flutter/data/app_database.dart';
import 'package:moor/moor.dart';

part 'prayers_dao.g.dart';

class Prayers extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();

  IntColumn get prayerName => integer().named('PRAYERNAME')();

  TextColumn get prayerText => text().named('PRAYERTEXT')();

  TextColumn get groupName => text().named('GROUPNAME')();

  @override
  String get tableName => 'PRAYERS';
}

@UseDao(tables: [Prayers])
class PrayersDao extends DatabaseAccessor<AppDatabase> with _$PrayersDaoMixin {
  PrayersDao(AppDatabase db) : super(db);

  Future<List<Prayer>> getAllPrayers() => select(prayers).get();

  Future insertCommandment(Insertable<Prayer> prayer) =>
      into(prayers).insert(prayer);
}
