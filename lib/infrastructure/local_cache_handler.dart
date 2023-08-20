import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:potato_timer/domain/i_exceptions.dart';
import 'package:potato_timer/domain/i_local_cache_handler.dart';
import 'package:potato_timer/domain/models/models.dart';
import 'package:potato_timer/infrastructure/database/app_database.dart';
import 'package:potato_timer/infrastructure/exceptions.dart';
import 'package:potato_timer/infrastructure/infra_to_domain.dart';

@Injectable(as: ILocalCacheHandler)
class LocalCacheHandler implements ILocalCacheHandler {
  LocalCacheHandler(
    this._appDatabase,
  );

  final AppDatabase _appDatabase;

  @override
  Future<Either<IAppException, bool>> addTask({
    required PotatoTimerTask task,
  }) async {
    try {
      await _appDatabase.into(_appDatabase.tasks).insert(
            TasksCompanion.insert(
              title: task.title,
              description: task.description,
              elapsedSeconds: task.elapsedSeconds,
            ),
          );
      return right(true);
    } on Exception catch (_) {
      return left(
        RecognizedException('Something went Wrong...'),
      );
    }
  }

  @override
  Future<Either<IAppException, bool>> deleteTask({
    required PotatoTimerTask task,
  }) async {
    try {
      final deletedRow = await _appDatabase.delete(_appDatabase.tasks).delete(
            TasksCompanion(
              id: Value(task.id!),
            ),
          );
      return right(deletedRow > 0);
    } on Exception catch (_) {
      return left(
        RecognizedException('Something went Wrong...'),
      );
    }
  }

  @override
  Future<Either<IAppException, bool>> updateTask({
    required PotatoTimerTask task,
  }) async {
    try {
      final success = await _appDatabase.update(_appDatabase.tasks).replace(
            TasksCompanion(
              id: Value(task.id!),
              title: Value(task.title),
              description: Value(task.description),
              elapsedSeconds: Value(task.elapsedSeconds),
            ),
          );
      return right(success);
    } on Exception catch (_) {
      return left(
        RecognizedException('Something went Wrong...'),
      );
    }
  }

  @override
  Future<Either<IAppException, List<PotatoTimerTask>>>
      getAllSavedTasks() async {
    try {
      final tasksFromDb = await _appDatabase.select(_appDatabase.tasks).get();
      final tasks = tasksFromDb.map(getTaskFromInfraDto).toList();

      return right(tasks);
    } on Exception catch (_) {
      return left(
        RecognizedException('Something went Wrong...'),
      );
    }
  }
}
