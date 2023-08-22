import 'package:dartz/dartz.dart';
import 'package:potato_timer/domain/i_exceptions.dart';
import 'package:potato_timer/domain/models/models.dart';

/// This interface [ILocalCacheHandler] will act as the bridge between
/// presentation layer and the infrastructure layer for the database operations.
abstract class ILocalCacheHandler {

  /// Add any [task] to the database, It will be instant.
  Future<Either<IAppException, bool>> addTask({
    required PotatoTimerTask task,
  });

  /// Update any [task] into the database. It will be instant.
  /// [task.id] is required here.
  Future<Either<IAppException, bool>> updateTask({
    required PotatoTimerTask task,
  });

  /// Get all saved tasks at once from db
  Future<Either<IAppException, List<PotatoTimerTask>>> getAllSavedTasks();

  // delete the task from db, it will be instant
  Future<Either<IAppException, bool>> deleteTask({
    required PotatoTimerTask task,
  });
}
