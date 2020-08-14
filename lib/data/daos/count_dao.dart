import 'package:moor/moor.dart';

import '../app_database.dart';

part 'count_dao.g.dart';

class Counts extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();

  IntColumn get sinId => integer().named('SINS_ID')();

  IntColumn get count => integer().named('COUNT')();

  @override
  Set<Column> get primaryKey => {sinId};

  @override
  String get tableName => 'person_2_sin';
}

@UseDao(tables: [Counts])
class CountsDao extends DatabaseAccessor<AppDatabase> with _$CountsDaoMixin {
  CountsDao(AppDatabase db) : super(db);

  void updateCountForId(CountsCompanion count) {
    into(counts).insertOnConflictUpdate(count);
  }
}
