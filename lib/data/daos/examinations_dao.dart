import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/data/user.dart';
import 'package:moor/moor.dart';

part 'examinations_dao.g.dart';

class Examinations extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();

  IntColumn get commandmentId => integer().named('COMMANDMENT_ID')();

  BoolColumn get adult => boolean().named('ADULT')();

  BoolColumn get single => boolean().named('SINGLE')();

  BoolColumn get married => boolean().named('MARRIED')();

  BoolColumn get religious => boolean().named('RELIGIOUS')();

  BoolColumn get priest => boolean().named('PRIEST')();

  BoolColumn get teen => boolean().named('TEEN')();

  BoolColumn get female => boolean().named('FEMALE')();

  BoolColumn get male => boolean().named('MALE')();

  BoolColumn get child => boolean().named('CHILD')();

  IntColumn get customId => integer().named('CUSTOM_ID').nullable()();

  TextColumn get description => text().named('DESCRIPTION')();

  TextColumn get activeText => text().named('DESCRIPTION_ACTIVE')();

  IntColumn get count => integer().named('COUNT').withDefault(Constant(0))();

  @override
  String get tableName => 'SIN';
}

@UseDao(
  tables: [Examinations],
)
class ExaminationsDao extends DatabaseAccessor<AppDatabase>
    with _$ExaminationsDaoMixin {
  ExaminationsDao(AppDatabase db) : super(db);

  Future<List<Examination>> getExaminationsForId(int commandmentId) =>
      (select(examinations)
            ..where((t) => t.commandmentId.equals(commandmentId)))
          .get();

  Stream<List<Examination>> getExaminationsForUserAndId(
      int commandmentId, User user) {
    Expression<bool> vocationQuery;
    Expression<bool> genderQuery;
    Expression<bool> ageQuery;

    switch (user.vocation) {
      case Vocation.single:
        vocationQuery = $ExaminationsTable(db).single.equals(true);
        break;
      case Vocation.married:
        vocationQuery = $ExaminationsTable(db).married.equals(true);
        break;
      case Vocation.priest:
        vocationQuery = $ExaminationsTable(db).priest.equals(true);
        break;
      case Vocation.religious:
        vocationQuery = $ExaminationsTable(db).religious.equals(true);
        break;
    }

    switch (user.gender) {
      case Gender.male:
        genderQuery = $ExaminationsTable(db).male.equals(true);
        break;
      case Gender.female:
        genderQuery = $ExaminationsTable(db).female.equals(true);
        break;
    }

    switch (user.age) {
      case Age.adult:
        ageQuery = $ExaminationsTable(db).adult.equals(true);
        break;
      case Age.teen:
        ageQuery = $ExaminationsTable(db).teen.equals(true);
        break;
      case Age.child:
        ageQuery = $ExaminationsTable(db).child.equals(true);
        break;
    }

    if (user.age != Age.adult) {
      return (select(examinations)
            ..where((t) => t.commandmentId.equals(commandmentId) & ageQuery))
          .watch();
    }

    return (select(examinations)
          ..where((t) =>
              t.commandmentId.equals(commandmentId) &
              vocationQuery &
              genderQuery &
              ageQuery))
        .watch();
  }

  Future<int> updateCountForExamination(Examination examination) {
    return into(examinations).insertOnConflictUpdate(examination);
  }

  Stream<List<Examination>> getActiveExaminations() {
    return (select(examinations)
          ..where((tbl) => tbl.count.isBiggerThanValue(0)))
        .watch();
  }
}
