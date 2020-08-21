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

class Inspirations extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();

  TextColumn get author => text().named('AUTHOR')();

  TextColumn get quote => text().named('QUOTE')();

  @override
  String get tableName => 'INSPIRATION';
}

@UseDao(tables: [Prayers, Inspirations])
class PrayersDao extends DatabaseAccessor<AppDatabase> with _$PrayersDaoMixin {
  PrayersDao(AppDatabase db) : super(db);

  Future<List<Prayer>> getAllPrayers() => select(prayers).get();

  Future<Prayer> getPrayerForId(int id) =>
      (select(prayers)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<Inspiration> getInspirationForId(int id) =>
      (select(inspirations)..where((tbl) => tbl.id.equals(id))).getSingle();

  void resetExaminationsCount() async {
    final table = db.examinations;
    var query = await (update(table)
          ..where((tbl) => tbl.count.isBiggerThanValue(0)))
        .write(ExaminationsCompanion(count: Value(0)));
  }
}
