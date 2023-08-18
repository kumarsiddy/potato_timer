import 'package:dartz/dartz.dart';
import 'package:potato_timer/domain/i_exceptions.dart';
import 'package:potato_timer/domain/models/potato_timer_task.dart';

abstract class ITaskHandlerFacade {
  Future<Either<IAppException, bool>> addTask({
    required PotatoTimerTask task,
  });

  Future<Either<IAppException, bool>> updateTask({
    required PotatoTimerTask task,
  });

  // Future<Either<IAppException, bool>> updateAllTasks({
  //   required List<PotatoTimerTask> tasks,
  // });

  Future<Either<IAppException, bool>> deleteTask({
    required PotatoTimerTask task,
  });

// Future<Either<Exception, bool>> deleteAllTasks({
//   required List<PotatoTimerTask> tasks,
// });
}
