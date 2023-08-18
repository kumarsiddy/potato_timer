import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:potato_timer/domain/i_exceptions.dart';
import 'package:potato_timer/domain/i_task_handler_facade.dart';
import 'package:potato_timer/domain/models/models.dart';
import 'package:potato_timer/infrastructure/database/app_database.dart';
import 'package:potato_timer/infrastructure/exceptions.dart';

@Injectable(as: ITaskHandlerFacade)
class TaskHandlerFacade extends ITaskHandlerFacade {
  TaskHandlerFacade(
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
              finishAt: task.finishAt,
            ),
          );
      return right(true);
    } on Exception catch (_) {
      return left(
        RecognizedException('Something went Wrong...'),
      );
    }
  }

  // @override
  // Future<Either<IAppException, bool>> deleteAllTasks({
  //   required List<PotatoTimerTask> tasks,
  // }) async {}

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

  // @override
  // Future<Either<IAppException, bool>> updateAllTasks({
  //   required List<PotatoTimerTask> tasks,
  // }) {}

  @override
  Future<Either<IAppException, bool>> updateTask({
    required PotatoTimerTask task,
  }) async {
    try {
      final success = await _appDatabase.update(_appDatabase.tasks).replace(
            TasksCompanion(
              id: Value(task.id!),
              finishAt: Value(task.finishAt),
            ),
          );
      return right(success);
    } on Exception catch (_) {
      return left(
        RecognizedException('Something went Wrong...'),
      );
    }
  }
}
