import 'package:confession_flutter/data/app_database.dart';
import 'package:moor/moor.dart';

part 'commandments_dao.g.dart';

class Commandments extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();

  IntColumn get number => integer().named('NUMBER')();

  TextColumn get commandmentText => text().named('TEXT')();

  TextColumn get category => text().named('CATEGORY')();

  TextColumn get commandment => text().named('COMMANDMENT')();

  IntColumn get customId => integer().named('CUSTOM_ID').nullable()();

  @override
  String get tableName => 'COMMANDMENTS';
}

@UseDao(tables: [Commandments])
class CommandmentsDao extends DatabaseAccessor<AppDatabase>
    with _$CommandmentsDaoMixin {
  CommandmentsDao(AppDatabase db) : super(db);

  Future<List<Commandment>> getAllCommandments() => select(commandments).get();

  Future insertCommandment(Insertable<Commandment> commandment) =>
      into(commandments).insert(commandment);
}
