import 'package:dartz/dartz.dart';
import 'package:potato_timer/domain/i_exceptions.dart';
import 'package:potato_timer/domain/models/models.dart';

abstract class ILocalCacheHandler {
  Future<Either<IAppException, bool>> addTask({
    required PotatoTimerTask task,
  });

  Future<Either<IAppException, bool>> updateTask({
    required PotatoTimerTask task,
  });

  Future<Either<IAppException, List<PotatoTimerTask>>> getAllSavedTasks();

  Future<Either<IAppException, bool>> deleteTask({
    required PotatoTimerTask task,
  });
}
