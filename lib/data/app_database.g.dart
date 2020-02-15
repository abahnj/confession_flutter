// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Commandment extends DataClass implements Insertable<Commandment> {
  final int id;
  final int number;
  final String commandmentText;
  final String category;
  final String commandment;
  final int customId;
  Commandment(
      {@required this.id,
      @required this.number,
      @required this.commandmentText,
      @required this.category,
      @required this.commandment,
      this.customId});
  factory Commandment.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Commandment(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      number: intType.mapFromDatabaseResponse(data['${effectivePrefix}NUMBER']),
      commandmentText:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}TEXT']),
      category: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}CATEGORY']),
      commandment: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}COMMANDMENT']),
      customId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}CUSTOM_ID']),
    );
  }
  factory Commandment.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Commandment(
      id: serializer.fromJson<int>(json['id']),
      number: serializer.fromJson<int>(json['number']),
      commandmentText: serializer.fromJson<String>(json['commandmentText']),
      category: serializer.fromJson<String>(json['category']),
      commandment: serializer.fromJson<String>(json['commandment']),
      customId: serializer.fromJson<int>(json['customId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'number': serializer.toJson<int>(number),
      'commandmentText': serializer.toJson<String>(commandmentText),
      'category': serializer.toJson<String>(category),
      'commandment': serializer.toJson<String>(commandment),
      'customId': serializer.toJson<int>(customId),
    };
  }

  @override
  CommandmentsCompanion createCompanion(bool nullToAbsent) {
    return CommandmentsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
      commandmentText: commandmentText == null && nullToAbsent
          ? const Value.absent()
          : Value(commandmentText),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      commandment: commandment == null && nullToAbsent
          ? const Value.absent()
          : Value(commandment),
      customId: customId == null && nullToAbsent
          ? const Value.absent()
          : Value(customId),
    );
  }

  Commandment copyWith(
          {int id,
          int number,
          String commandmentText,
          String category,
          String commandment,
          int customId}) =>
      Commandment(
        id: id ?? this.id,
        number: number ?? this.number,
        commandmentText: commandmentText ?? this.commandmentText,
        category: category ?? this.category,
        commandment: commandment ?? this.commandment,
        customId: customId ?? this.customId,
      );
  @override
  String toString() {
    return (StringBuffer('Commandment(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('commandmentText: $commandmentText, ')
          ..write('category: $category, ')
          ..write('commandment: $commandment, ')
          ..write('customId: $customId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          number.hashCode,
          $mrjc(
              commandmentText.hashCode,
              $mrjc(category.hashCode,
                  $mrjc(commandment.hashCode, customId.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Commandment &&
          other.id == this.id &&
          other.number == this.number &&
          other.commandmentText == this.commandmentText &&
          other.category == this.category &&
          other.commandment == this.commandment &&
          other.customId == this.customId);
}

class CommandmentsCompanion extends UpdateCompanion<Commandment> {
  final Value<int> id;
  final Value<int> number;
  final Value<String> commandmentText;
  final Value<String> category;
  final Value<String> commandment;
  final Value<int> customId;
  const CommandmentsCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.commandmentText = const Value.absent(),
    this.category = const Value.absent(),
    this.commandment = const Value.absent(),
    this.customId = const Value.absent(),
  });
  CommandmentsCompanion.insert({
    this.id = const Value.absent(),
    @required int number,
    @required String commandmentText,
    @required String category,
    @required String commandment,
    this.customId = const Value.absent(),
  })  : number = Value(number),
        commandmentText = Value(commandmentText),
        category = Value(category),
        commandment = Value(commandment);
  CommandmentsCompanion copyWith(
      {Value<int> id,
      Value<int> number,
      Value<String> commandmentText,
      Value<String> category,
      Value<String> commandment,
      Value<int> customId}) {
    return CommandmentsCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      commandmentText: commandmentText ?? this.commandmentText,
      category: category ?? this.category,
      commandment: commandment ?? this.commandment,
      customId: customId ?? this.customId,
    );
  }
}

class $CommandmentsTable extends Commandments
    with TableInfo<$CommandmentsTable, Commandment> {
  final GeneratedDatabase _db;
  final String _alias;
  $CommandmentsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _numberMeta = const VerificationMeta('number');
  GeneratedIntColumn _number;
  @override
  GeneratedIntColumn get number => _number ??= _constructNumber();
  GeneratedIntColumn _constructNumber() {
    return GeneratedIntColumn(
      'NUMBER',
      $tableName,
      false,
    );
  }

  final VerificationMeta _commandmentTextMeta =
      const VerificationMeta('commandmentText');
  GeneratedTextColumn _commandmentText;
  @override
  GeneratedTextColumn get commandmentText =>
      _commandmentText ??= _constructCommandmentText();
  GeneratedTextColumn _constructCommandmentText() {
    return GeneratedTextColumn(
      'TEXT',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedTextColumn _category;
  @override
  GeneratedTextColumn get category => _category ??= _constructCategory();
  GeneratedTextColumn _constructCategory() {
    return GeneratedTextColumn(
      'CATEGORY',
      $tableName,
      false,
    );
  }

  final VerificationMeta _commandmentMeta =
      const VerificationMeta('commandment');
  GeneratedTextColumn _commandment;
  @override
  GeneratedTextColumn get commandment =>
      _commandment ??= _constructCommandment();
  GeneratedTextColumn _constructCommandment() {
    return GeneratedTextColumn(
      'COMMANDMENT',
      $tableName,
      false,
    );
  }

  final VerificationMeta _customIdMeta = const VerificationMeta('customId');
  GeneratedIntColumn _customId;
  @override
  GeneratedIntColumn get customId => _customId ??= _constructCustomId();
  GeneratedIntColumn _constructCustomId() {
    return GeneratedIntColumn(
      'CUSTOM_ID',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, number, commandmentText, category, commandment, customId];
  @override
  $CommandmentsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'COMMANDMENTS';
  @override
  final String actualTableName = 'COMMANDMENTS';
  @override
  VerificationContext validateIntegrity(CommandmentsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.number.present) {
      context.handle(
          _numberMeta, number.isAcceptableValue(d.number.value, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (d.commandmentText.present) {
      context.handle(
          _commandmentTextMeta,
          commandmentText.isAcceptableValue(
              d.commandmentText.value, _commandmentTextMeta));
    } else if (isInserting) {
      context.missing(_commandmentTextMeta);
    }
    if (d.category.present) {
      context.handle(_categoryMeta,
          category.isAcceptableValue(d.category.value, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (d.commandment.present) {
      context.handle(_commandmentMeta,
          commandment.isAcceptableValue(d.commandment.value, _commandmentMeta));
    } else if (isInserting) {
      context.missing(_commandmentMeta);
    }
    if (d.customId.present) {
      context.handle(_customIdMeta,
          customId.isAcceptableValue(d.customId.value, _customIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Commandment map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Commandment.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CommandmentsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['_id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.number.present) {
      map['NUMBER'] = Variable<int, IntType>(d.number.value);
    }
    if (d.commandmentText.present) {
      map['TEXT'] = Variable<String, StringType>(d.commandmentText.value);
    }
    if (d.category.present) {
      map['CATEGORY'] = Variable<String, StringType>(d.category.value);
    }
    if (d.commandment.present) {
      map['COMMANDMENT'] = Variable<String, StringType>(d.commandment.value);
    }
    if (d.customId.present) {
      map['CUSTOM_ID'] = Variable<int, IntType>(d.customId.value);
    }
    return map;
  }

  @override
  $CommandmentsTable createAlias(String alias) {
    return $CommandmentsTable(_db, alias);
  }
}

class Examination extends DataClass implements Insertable<Examination> {
  final int id;
  final int commandmentId;
  final bool adult;
  final bool single;
  final bool married;
  final bool religious;
  final bool priest;
  final bool teen;
  final bool female;
  final bool male;
  final bool child;
  final int customId;
  final String description;
  final int count;
  Examination(
      {@required this.id,
      @required this.commandmentId,
      @required this.adult,
      @required this.single,
      @required this.married,
      @required this.religious,
      @required this.priest,
      @required this.teen,
      @required this.female,
      @required this.male,
      @required this.child,
      this.customId,
      @required this.description,
      @required this.count});
  factory Examination.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    final stringType = db.typeSystem.forDartType<String>();
    return Examination(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      commandmentId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}COMMANDMENT_ID']),
      adult: boolType.mapFromDatabaseResponse(data['${effectivePrefix}ADULT']),
      single:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}SINGLE']),
      married:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}MARRIED']),
      religious:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}RELIGIOUS']),
      priest:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}PRIEST']),
      teen: boolType.mapFromDatabaseResponse(data['${effectivePrefix}TEEN']),
      female:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}FEMALE']),
      male: boolType.mapFromDatabaseResponse(data['${effectivePrefix}MALE']),
      child: boolType.mapFromDatabaseResponse(data['${effectivePrefix}CHILD']),
      customId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}CUSTOM_ID']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}DESCRIPTION']),
      count: intType.mapFromDatabaseResponse(data['${effectivePrefix}COUNT']),
    );
  }
  factory Examination.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Examination(
      id: serializer.fromJson<int>(json['id']),
      commandmentId: serializer.fromJson<int>(json['commandmentId']),
      adult: serializer.fromJson<bool>(json['adult']),
      single: serializer.fromJson<bool>(json['single']),
      married: serializer.fromJson<bool>(json['married']),
      religious: serializer.fromJson<bool>(json['religious']),
      priest: serializer.fromJson<bool>(json['priest']),
      teen: serializer.fromJson<bool>(json['teen']),
      female: serializer.fromJson<bool>(json['female']),
      male: serializer.fromJson<bool>(json['male']),
      child: serializer.fromJson<bool>(json['child']),
      customId: serializer.fromJson<int>(json['customId']),
      description: serializer.fromJson<String>(json['description']),
      count: serializer.fromJson<int>(json['count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'commandmentId': serializer.toJson<int>(commandmentId),
      'adult': serializer.toJson<bool>(adult),
      'single': serializer.toJson<bool>(single),
      'married': serializer.toJson<bool>(married),
      'religious': serializer.toJson<bool>(religious),
      'priest': serializer.toJson<bool>(priest),
      'teen': serializer.toJson<bool>(teen),
      'female': serializer.toJson<bool>(female),
      'male': serializer.toJson<bool>(male),
      'child': serializer.toJson<bool>(child),
      'customId': serializer.toJson<int>(customId),
      'description': serializer.toJson<String>(description),
      'count': serializer.toJson<int>(count),
    };
  }

  @override
  ExaminationsCompanion createCompanion(bool nullToAbsent) {
    return ExaminationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      commandmentId: commandmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(commandmentId),
      adult:
          adult == null && nullToAbsent ? const Value.absent() : Value(adult),
      single:
          single == null && nullToAbsent ? const Value.absent() : Value(single),
      married: married == null && nullToAbsent
          ? const Value.absent()
          : Value(married),
      religious: religious == null && nullToAbsent
          ? const Value.absent()
          : Value(religious),
      priest:
          priest == null && nullToAbsent ? const Value.absent() : Value(priest),
      teen: teen == null && nullToAbsent ? const Value.absent() : Value(teen),
      female:
          female == null && nullToAbsent ? const Value.absent() : Value(female),
      male: male == null && nullToAbsent ? const Value.absent() : Value(male),
      child:
          child == null && nullToAbsent ? const Value.absent() : Value(child),
      customId: customId == null && nullToAbsent
          ? const Value.absent()
          : Value(customId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      count:
          count == null && nullToAbsent ? const Value.absent() : Value(count),
    );
  }

  Examination copyWith(
          {int id,
          int commandmentId,
          bool adult,
          bool single,
          bool married,
          bool religious,
          bool priest,
          bool teen,
          bool female,
          bool male,
          bool child,
          int customId,
          String description,
          int count}) =>
      Examination(
        id: id ?? this.id,
        commandmentId: commandmentId ?? this.commandmentId,
        adult: adult ?? this.adult,
        single: single ?? this.single,
        married: married ?? this.married,
        religious: religious ?? this.religious,
        priest: priest ?? this.priest,
        teen: teen ?? this.teen,
        female: female ?? this.female,
        male: male ?? this.male,
        child: child ?? this.child,
        customId: customId ?? this.customId,
        description: description ?? this.description,
        count: count ?? this.count,
      );
  @override
  String toString() {
    return (StringBuffer('Examination(')
          ..write('id: $id, ')
          ..write('commandmentId: $commandmentId, ')
          ..write('adult: $adult, ')
          ..write('single: $single, ')
          ..write('married: $married, ')
          ..write('religious: $religious, ')
          ..write('priest: $priest, ')
          ..write('teen: $teen, ')
          ..write('female: $female, ')
          ..write('male: $male, ')
          ..write('child: $child, ')
          ..write('customId: $customId, ')
          ..write('description: $description, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          commandmentId.hashCode,
          $mrjc(
              adult.hashCode,
              $mrjc(
                  single.hashCode,
                  $mrjc(
                      married.hashCode,
                      $mrjc(
                          religious.hashCode,
                          $mrjc(
                              priest.hashCode,
                              $mrjc(
                                  teen.hashCode,
                                  $mrjc(
                                      female.hashCode,
                                      $mrjc(
                                          male.hashCode,
                                          $mrjc(
                                              child.hashCode,
                                              $mrjc(
                                                  customId.hashCode,
                                                  $mrjc(
                                                      description.hashCode,
                                                      count
                                                          .hashCode))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Examination &&
          other.id == this.id &&
          other.commandmentId == this.commandmentId &&
          other.adult == this.adult &&
          other.single == this.single &&
          other.married == this.married &&
          other.religious == this.religious &&
          other.priest == this.priest &&
          other.teen == this.teen &&
          other.female == this.female &&
          other.male == this.male &&
          other.child == this.child &&
          other.customId == this.customId &&
          other.description == this.description &&
          other.count == this.count);
}

class ExaminationsCompanion extends UpdateCompanion<Examination> {
  final Value<int> id;
  final Value<int> commandmentId;
  final Value<bool> adult;
  final Value<bool> single;
  final Value<bool> married;
  final Value<bool> religious;
  final Value<bool> priest;
  final Value<bool> teen;
  final Value<bool> female;
  final Value<bool> male;
  final Value<bool> child;
  final Value<int> customId;
  final Value<String> description;
  final Value<int> count;
  const ExaminationsCompanion({
    this.id = const Value.absent(),
    this.commandmentId = const Value.absent(),
    this.adult = const Value.absent(),
    this.single = const Value.absent(),
    this.married = const Value.absent(),
    this.religious = const Value.absent(),
    this.priest = const Value.absent(),
    this.teen = const Value.absent(),
    this.female = const Value.absent(),
    this.male = const Value.absent(),
    this.child = const Value.absent(),
    this.customId = const Value.absent(),
    this.description = const Value.absent(),
    this.count = const Value.absent(),
  });
  ExaminationsCompanion.insert({
    this.id = const Value.absent(),
    @required int commandmentId,
    @required bool adult,
    @required bool single,
    @required bool married,
    @required bool religious,
    @required bool priest,
    @required bool teen,
    @required bool female,
    @required bool male,
    @required bool child,
    this.customId = const Value.absent(),
    @required String description,
    this.count = const Value.absent(),
  })  : commandmentId = Value(commandmentId),
        adult = Value(adult),
        single = Value(single),
        married = Value(married),
        religious = Value(religious),
        priest = Value(priest),
        teen = Value(teen),
        female = Value(female),
        male = Value(male),
        child = Value(child),
        description = Value(description);
  ExaminationsCompanion copyWith(
      {Value<int> id,
      Value<int> commandmentId,
      Value<bool> adult,
      Value<bool> single,
      Value<bool> married,
      Value<bool> religious,
      Value<bool> priest,
      Value<bool> teen,
      Value<bool> female,
      Value<bool> male,
      Value<bool> child,
      Value<int> customId,
      Value<String> description,
      Value<int> count}) {
    return ExaminationsCompanion(
      id: id ?? this.id,
      commandmentId: commandmentId ?? this.commandmentId,
      adult: adult ?? this.adult,
      single: single ?? this.single,
      married: married ?? this.married,
      religious: religious ?? this.religious,
      priest: priest ?? this.priest,
      teen: teen ?? this.teen,
      female: female ?? this.female,
      male: male ?? this.male,
      child: child ?? this.child,
      customId: customId ?? this.customId,
      description: description ?? this.description,
      count: count ?? this.count,
    );
  }
}

class $ExaminationsTable extends Examinations
    with TableInfo<$ExaminationsTable, Examination> {
  final GeneratedDatabase _db;
  final String _alias;
  $ExaminationsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _commandmentIdMeta =
      const VerificationMeta('commandmentId');
  GeneratedIntColumn _commandmentId;
  @override
  GeneratedIntColumn get commandmentId =>
      _commandmentId ??= _constructCommandmentId();
  GeneratedIntColumn _constructCommandmentId() {
    return GeneratedIntColumn(
      'COMMANDMENT_ID',
      $tableName,
      false,
    );
  }

  final VerificationMeta _adultMeta = const VerificationMeta('adult');
  GeneratedBoolColumn _adult;
  @override
  GeneratedBoolColumn get adult => _adult ??= _constructAdult();
  GeneratedBoolColumn _constructAdult() {
    return GeneratedBoolColumn(
      'ADULT',
      $tableName,
      false,
    );
  }

  final VerificationMeta _singleMeta = const VerificationMeta('single');
  GeneratedBoolColumn _single;
  @override
  GeneratedBoolColumn get single => _single ??= _constructSingle();
  GeneratedBoolColumn _constructSingle() {
    return GeneratedBoolColumn(
      'SINGLE',
      $tableName,
      false,
    );
  }

  final VerificationMeta _marriedMeta = const VerificationMeta('married');
  GeneratedBoolColumn _married;
  @override
  GeneratedBoolColumn get married => _married ??= _constructMarried();
  GeneratedBoolColumn _constructMarried() {
    return GeneratedBoolColumn(
      'MARRIED',
      $tableName,
      false,
    );
  }

  final VerificationMeta _religiousMeta = const VerificationMeta('religious');
  GeneratedBoolColumn _religious;
  @override
  GeneratedBoolColumn get religious => _religious ??= _constructReligious();
  GeneratedBoolColumn _constructReligious() {
    return GeneratedBoolColumn(
      'RELIGIOUS',
      $tableName,
      false,
    );
  }

  final VerificationMeta _priestMeta = const VerificationMeta('priest');
  GeneratedBoolColumn _priest;
  @override
  GeneratedBoolColumn get priest => _priest ??= _constructPriest();
  GeneratedBoolColumn _constructPriest() {
    return GeneratedBoolColumn(
      'PRIEST',
      $tableName,
      false,
    );
  }

  final VerificationMeta _teenMeta = const VerificationMeta('teen');
  GeneratedBoolColumn _teen;
  @override
  GeneratedBoolColumn get teen => _teen ??= _constructTeen();
  GeneratedBoolColumn _constructTeen() {
    return GeneratedBoolColumn(
      'TEEN',
      $tableName,
      false,
    );
  }

  final VerificationMeta _femaleMeta = const VerificationMeta('female');
  GeneratedBoolColumn _female;
  @override
  GeneratedBoolColumn get female => _female ??= _constructFemale();
  GeneratedBoolColumn _constructFemale() {
    return GeneratedBoolColumn(
      'FEMALE',
      $tableName,
      false,
    );
  }

  final VerificationMeta _maleMeta = const VerificationMeta('male');
  GeneratedBoolColumn _male;
  @override
  GeneratedBoolColumn get male => _male ??= _constructMale();
  GeneratedBoolColumn _constructMale() {
    return GeneratedBoolColumn(
      'MALE',
      $tableName,
      false,
    );
  }

  final VerificationMeta _childMeta = const VerificationMeta('child');
  GeneratedBoolColumn _child;
  @override
  GeneratedBoolColumn get child => _child ??= _constructChild();
  GeneratedBoolColumn _constructChild() {
    return GeneratedBoolColumn(
      'CHILD',
      $tableName,
      false,
    );
  }

  final VerificationMeta _customIdMeta = const VerificationMeta('customId');
  GeneratedIntColumn _customId;
  @override
  GeneratedIntColumn get customId => _customId ??= _constructCustomId();
  GeneratedIntColumn _constructCustomId() {
    return GeneratedIntColumn(
      'CUSTOM_ID',
      $tableName,
      true,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'DESCRIPTION',
      $tableName,
      false,
    );
  }

  final VerificationMeta _countMeta = const VerificationMeta('count');
  GeneratedIntColumn _count;
  @override
  GeneratedIntColumn get count => _count ??= _constructCount();
  GeneratedIntColumn _constructCount() {
    return GeneratedIntColumn('COUNT', $tableName, false,
        defaultValue: Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        commandmentId,
        adult,
        single,
        married,
        religious,
        priest,
        teen,
        female,
        male,
        child,
        customId,
        description,
        count
      ];
  @override
  $ExaminationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'SIN';
  @override
  final String actualTableName = 'SIN';
  @override
  VerificationContext validateIntegrity(ExaminationsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.commandmentId.present) {
      context.handle(
          _commandmentIdMeta,
          commandmentId.isAcceptableValue(
              d.commandmentId.value, _commandmentIdMeta));
    } else if (isInserting) {
      context.missing(_commandmentIdMeta);
    }
    if (d.adult.present) {
      context.handle(
          _adultMeta, adult.isAcceptableValue(d.adult.value, _adultMeta));
    } else if (isInserting) {
      context.missing(_adultMeta);
    }
    if (d.single.present) {
      context.handle(
          _singleMeta, single.isAcceptableValue(d.single.value, _singleMeta));
    } else if (isInserting) {
      context.missing(_singleMeta);
    }
    if (d.married.present) {
      context.handle(_marriedMeta,
          married.isAcceptableValue(d.married.value, _marriedMeta));
    } else if (isInserting) {
      context.missing(_marriedMeta);
    }
    if (d.religious.present) {
      context.handle(_religiousMeta,
          religious.isAcceptableValue(d.religious.value, _religiousMeta));
    } else if (isInserting) {
      context.missing(_religiousMeta);
    }
    if (d.priest.present) {
      context.handle(
          _priestMeta, priest.isAcceptableValue(d.priest.value, _priestMeta));
    } else if (isInserting) {
      context.missing(_priestMeta);
    }
    if (d.teen.present) {
      context.handle(
          _teenMeta, teen.isAcceptableValue(d.teen.value, _teenMeta));
    } else if (isInserting) {
      context.missing(_teenMeta);
    }
    if (d.female.present) {
      context.handle(
          _femaleMeta, female.isAcceptableValue(d.female.value, _femaleMeta));
    } else if (isInserting) {
      context.missing(_femaleMeta);
    }
    if (d.male.present) {
      context.handle(
          _maleMeta, male.isAcceptableValue(d.male.value, _maleMeta));
    } else if (isInserting) {
      context.missing(_maleMeta);
    }
    if (d.child.present) {
      context.handle(
          _childMeta, child.isAcceptableValue(d.child.value, _childMeta));
    } else if (isInserting) {
      context.missing(_childMeta);
    }
    if (d.customId.present) {
      context.handle(_customIdMeta,
          customId.isAcceptableValue(d.customId.value, _customIdMeta));
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (d.count.present) {
      context.handle(
          _countMeta, count.isAcceptableValue(d.count.value, _countMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Examination map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Examination.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ExaminationsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['_id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.commandmentId.present) {
      map['COMMANDMENT_ID'] = Variable<int, IntType>(d.commandmentId.value);
    }
    if (d.adult.present) {
      map['ADULT'] = Variable<bool, BoolType>(d.adult.value);
    }
    if (d.single.present) {
      map['SINGLE'] = Variable<bool, BoolType>(d.single.value);
    }
    if (d.married.present) {
      map['MARRIED'] = Variable<bool, BoolType>(d.married.value);
    }
    if (d.religious.present) {
      map['RELIGIOUS'] = Variable<bool, BoolType>(d.religious.value);
    }
    if (d.priest.present) {
      map['PRIEST'] = Variable<bool, BoolType>(d.priest.value);
    }
    if (d.teen.present) {
      map['TEEN'] = Variable<bool, BoolType>(d.teen.value);
    }
    if (d.female.present) {
      map['FEMALE'] = Variable<bool, BoolType>(d.female.value);
    }
    if (d.male.present) {
      map['MALE'] = Variable<bool, BoolType>(d.male.value);
    }
    if (d.child.present) {
      map['CHILD'] = Variable<bool, BoolType>(d.child.value);
    }
    if (d.customId.present) {
      map['CUSTOM_ID'] = Variable<int, IntType>(d.customId.value);
    }
    if (d.description.present) {
      map['DESCRIPTION'] = Variable<String, StringType>(d.description.value);
    }
    if (d.count.present) {
      map['COUNT'] = Variable<int, IntType>(d.count.value);
    }
    return map;
  }

  @override
  $ExaminationsTable createAlias(String alias) {
    return $ExaminationsTable(_db, alias);
  }
}

class Prayer extends DataClass implements Insertable<Prayer> {
  final int id;
  final String prayerName;
  final String prayerText;
  final String groupName;

  Prayer(
      {@required this.id,
      @required this.prayerName,
      @required this.prayerText,
      @required this.groupName});
  factory Prayer.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Prayer(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      prayerName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}PRAYERNAME']),
      prayerText: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}PRAYERTEXT']),
      groupName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}GROUPNAME']),
    );
  }
  factory Prayer.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Prayer(
      id: serializer.fromJson<int>(json['id']),
      prayerName: serializer.fromJson<String>(json['prayerName']),
      prayerText: serializer.fromJson<String>(json['prayerText']),
      groupName: serializer.fromJson<String>(json['groupName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'prayerName': serializer.toJson<String>(prayerName),
      'prayerText': serializer.toJson<String>(prayerText),
      'groupName': serializer.toJson<String>(groupName),
    };
  }

  @override
  PrayersCompanion createCompanion(bool nullToAbsent) {
    return PrayersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      prayerName: prayerName == null && nullToAbsent
          ? const Value.absent()
          : Value(prayerName),
      prayerText: prayerText == null && nullToAbsent
          ? const Value.absent()
          : Value(prayerText),
      groupName: groupName == null && nullToAbsent
          ? const Value.absent()
          : Value(groupName),
    );
  }

  Prayer copyWith(
          {int id, String prayerName, String prayerText, String groupName}) =>
      Prayer(
        id: id ?? this.id,
        prayerName: prayerName ?? this.prayerName,
        prayerText: prayerText ?? this.prayerText,
        groupName: groupName ?? this.groupName,
      );
  @override
  String toString() {
    return (StringBuffer('Prayer(')
          ..write('id: $id, ')
          ..write('prayerName: $prayerName, ')
          ..write('prayerText: $prayerText, ')
          ..write('groupName: $groupName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(prayerName.hashCode,
          $mrjc(prayerText.hashCode, groupName.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Prayer &&
          other.id == this.id &&
          other.prayerName == this.prayerName &&
          other.prayerText == this.prayerText &&
          other.groupName == this.groupName);
}

class PrayersCompanion extends UpdateCompanion<Prayer> {
  final Value<int> id;
  final Value<String> prayerName;
  final Value<String> prayerText;
  final Value<String> groupName;
  const PrayersCompanion({
    this.id = const Value.absent(),
    this.prayerName = const Value.absent(),
    this.prayerText = const Value.absent(),
    this.groupName = const Value.absent(),
  });
  PrayersCompanion.insert({
    this.id = const Value.absent(),
    @required String prayerName,
    @required String prayerText,
    @required String groupName,
  })  : prayerName = Value(prayerName),
        prayerText = Value(prayerText),
        groupName = Value(groupName);

  PrayersCompanion copyWith(
      {Value<int> id,
      Value<String> prayerName,
      Value<String> prayerText,
      Value<String> groupName}) {
    return PrayersCompanion(
      id: id ?? this.id,
      prayerName: prayerName ?? this.prayerName,
      prayerText: prayerText ?? this.prayerText,
      groupName: groupName ?? this.groupName,
    );
  }
}

class $PrayersTable extends Prayers with TableInfo<$PrayersTable, Prayer> {
  final GeneratedDatabase _db;
  final String _alias;
  $PrayersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _prayerNameMeta = const VerificationMeta('prayerName');
  GeneratedTextColumn _prayerName;
  @override
  GeneratedTextColumn get prayerName => _prayerName ??= _constructPrayerName();

  GeneratedTextColumn _constructPrayerName() {
    return GeneratedTextColumn(
      'PRAYERNAME',
      $tableName,
      false,
    );
  }

  final VerificationMeta _prayerTextMeta = const VerificationMeta('prayerText');
  GeneratedTextColumn _prayerText;
  @override
  GeneratedTextColumn get prayerText => _prayerText ??= _constructPrayerText();
  GeneratedTextColumn _constructPrayerText() {
    return GeneratedTextColumn(
      'PRAYERTEXT',
      $tableName,
      false,
    );
  }

  final VerificationMeta _groupNameMeta = const VerificationMeta('groupName');
  GeneratedTextColumn _groupName;
  @override
  GeneratedTextColumn get groupName => _groupName ??= _constructGroupName();
  GeneratedTextColumn _constructGroupName() {
    return GeneratedTextColumn(
      'GROUPNAME',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, prayerName, prayerText, groupName];
  @override
  $PrayersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'PRAYERS';
  @override
  final String actualTableName = 'PRAYERS';
  @override
  VerificationContext validateIntegrity(PrayersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.prayerName.present) {
      context.handle(_prayerNameMeta,
          prayerName.isAcceptableValue(d.prayerName.value, _prayerNameMeta));
    } else if (isInserting) {
      context.missing(_prayerNameMeta);
    }
    if (d.prayerText.present) {
      context.handle(_prayerTextMeta,
          prayerText.isAcceptableValue(d.prayerText.value, _prayerTextMeta));
    } else if (isInserting) {
      context.missing(_prayerTextMeta);
    }
    if (d.groupName.present) {
      context.handle(_groupNameMeta,
          groupName.isAcceptableValue(d.groupName.value, _groupNameMeta));
    } else if (isInserting) {
      context.missing(_groupNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Prayer map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Prayer.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(PrayersCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['_id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.prayerName.present) {
      map['PRAYERNAME'] = Variable<String, StringType>(d.prayerName.value);
    }
    if (d.prayerText.present) {
      map['PRAYERTEXT'] = Variable<String, StringType>(d.prayerText.value);
    }
    if (d.groupName.present) {
      map['GROUPNAME'] = Variable<String, StringType>(d.groupName.value);
    }
    return map;
  }

  @override
  $PrayersTable createAlias(String alias) {
    return $PrayersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CommandmentsTable _commandments;
  $CommandmentsTable get commandments =>
      _commandments ??= $CommandmentsTable(this);
  $ExaminationsTable _examinations;
  $ExaminationsTable get examinations =>
      _examinations ??= $ExaminationsTable(this);
  $PrayersTable _prayers;
  $PrayersTable get prayers => _prayers ??= $PrayersTable(this);
  CommandmentsDao _commandmentsDao;
  CommandmentsDao get commandmentsDao =>
      _commandmentsDao ??= CommandmentsDao(this as AppDatabase);
  ExaminationsDao _examinationsDao;
  ExaminationsDao get examinationsDao =>
      _examinationsDao ??= ExaminationsDao(this as AppDatabase);
  PrayersDao _prayersDao;
  PrayersDao get prayersDao => _prayersDao ??= PrayersDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [commandments, examinations, prayers];
}
