import 'dart:io';

import 'package:confession_flutter/data/daos/commandments_dao.dart';
import 'package:confession_flutter/data/daos/examinations_dao.dart';
import 'package:confession_flutter/data/daos/prayers_dao.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'daos/guides_dao.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection({bool reset = false}) {
  // after
  return LazyDatabase(() async {
    var databasesPath = await getApplicationDocumentsDirectory();
    var path = join(databasesPath.path, 'confession.db');

    final file = File(path);
    final filePath = join('assets', 'database', 'confession.db');

    return databaseWithDefaultAsset(file, filePath);

    // if (reset || !await file.exists()) {
    //   // copy the file from an asset, or network, or any other source
    //   // Should happen only the first time you launch your application
    //   print('Creating new copy from asset');
    //
    //   // Make sure the parent directory exists
    //   try {
    //     await Directory(dirname(path)).create(recursive: true);
    //   } catch (_) {}
    //
    //   // Copy from asset
    //   var data =
    //       await rootBundle.load(join('assets', 'database', 'confession.db'));
    //   List<int> bytes =
    //       data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    //
    //   // Write and flush the bytes written
    //   await file.writeAsBytes(bytes, flush: true);
    // } else {
    //   print('Opening existing database');
    // }
    // return NativeDatabase.createInBackground(file);
  });
}

QueryExecutor databaseWithDefaultAsset(File file, String asset) {
  // A LazyDatabase lets us do async initialization work.
  return LazyDatabase(() async {
    if (!await file.exists()) {
      // Database does not exist yet, use default from asset
      final content = await rootBundle.load(asset);

      await file.parent.create(recursive: true);
      await file.writeAsBytes(content.buffer.asUint8List(0));
    }
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(
    tables: [Commandments, Examinations, Prayers, Guides, Inspirations],
    daos: [CommandmentsDao, ExaminationsDao, PrayersDao, GuidesDao])
class AppDatabase extends _$AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() {
    return _instance;
  }

  AppDatabase._internal() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 4;
}
