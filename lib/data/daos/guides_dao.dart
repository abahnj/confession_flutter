import 'package:moor/moor.dart';

import '../app_database.dart';

part 'guides_dao.g.dart';

class Guides extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();

  TextColumn get guideTitle => text().named('g_title')();

  TextColumn get guideText => text().named('text')();

  IntColumn get headerId => integer().named('h_id')();

  @override
  String get tableName => 'guide_main';
}

@UseDao(tables: [Guides])
class GuidesDao extends DatabaseAccessor<AppDatabase> with _$GuidesDaoMixin {
  GuidesDao(AppDatabase db) : super(db);

  Future<List<Guide>> getAllGuides() => select(guides).get();

  Future<List<Guide>> getGuidesForId(int id) =>
      (select(guides)..where((tbl) => tbl.headerId.equals(id))).get();
}
