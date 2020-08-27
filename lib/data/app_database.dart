import 'dart:io';

import 'package:confession_flutter/data/daos/commandments_dao.dart';
import 'package:confession_flutter/data/daos/examinations_dao.dart';
import 'package:confession_flutter/data/daos/prayers_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
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
    if (reset || !await file.exists()) {
      // copy the file from an asset, or network, or any other source
      // Should happen only the first time you launch your application
      print('Creating new copy from asset');

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      var data =
          await rootBundle.load(join('assets', 'database', 'confession.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await file.writeAsBytes(bytes, flush: true);
    } else {
      print('Opening existing database');
    }
    return VmDatabase(file);
  });
}

@UseMoor(
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
