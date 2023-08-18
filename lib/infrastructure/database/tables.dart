import 'package:drift/drift.dart';

/// Representation of PotatoTimerTasks from model
/// which will be saved into database
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 6, max: 32)();

  TextColumn get description => text().withLength(min: 6, max: 120)();

  DateTimeColumn get finishAt => dateTime()();
}
