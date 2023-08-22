import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:potato_timer/infrastructure/database/tables.dart';

part 'app_database.g.dart';

/// Represents the database connection for the app.
@singleton
@DriftDatabase(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(path.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase.createInBackground(file);
    },
  );
}
