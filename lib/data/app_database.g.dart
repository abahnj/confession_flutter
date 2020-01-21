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
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
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
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
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
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.number.present) {
      context.handle(
          _numberMeta, number.isAcceptableValue(d.number.value, _numberMeta));
    } else if (number.isRequired && isInserting) {
      context.missing(_numberMeta);
    }
    if (d.commandmentText.present) {
      context.handle(
          _commandmentTextMeta,
          commandmentText.isAcceptableValue(
              d.commandmentText.value, _commandmentTextMeta));
    } else if (commandmentText.isRequired && isInserting) {
      context.missing(_commandmentTextMeta);
    }
    if (d.category.present) {
      context.handle(_categoryMeta,
          category.isAcceptableValue(d.category.value, _categoryMeta));
    } else if (category.isRequired && isInserting) {
      context.missing(_categoryMeta);
    }
    if (d.commandment.present) {
      context.handle(_commandmentMeta,
          commandment.isAcceptableValue(d.commandment.value, _commandmentMeta));
    } else if (commandment.isRequired && isInserting) {
      context.missing(_commandmentMeta);
    }
    if (d.customId.present) {
      context.handle(_customIdMeta,
          customId.isAcceptableValue(d.customId.value, _customIdMeta));
    } else if (customId.isRequired && isInserting) {
      context.missing(_customIdMeta);
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CommandmentsTable _commandments;

  $CommandmentsTable get commandments =>
      _commandments ??= $CommandmentsTable(this);
  CommandmentsDao _commandmentsDao;

  CommandmentsDao get commandmentsDao =>
      _commandmentsDao ??= CommandmentsDao(this as AppDatabase);

  @override
  List<TableInfo> get allTables => [commandments];
}
