import 'dart:async';
import 'dart:collection';

import 'package:injectable/injectable.dart';
import 'package:potato_timer/config/env.dart';
import 'package:potato_timer/domain/i_local_cache_handler.dart';
import 'package:potato_timer/domain/i_task_manager.dart';
import 'package:potato_timer/domain/models/models.dart';

@Singleton(as: ITaskManager, env: injectionEnv)
class TaskManager implements ITaskManager {
  TaskManager(this._localCacheHandler);

  final ILocalCacheHandler _localCacheHandler;

  final Queue<PotatoTimerTask> _taskQueue = Queue<PotatoTimerTask>();
  Timer? _timer;

  @override
  void addToQueue(
    PotatoTimerTask task,
  ) {
    _taskQueue
      ..removeWhere((element) => element.id == task.id)
      ..add(task);
  }

  @override
  int get periodicTimeInSeconds => 6;

  @override
  Future<void> runUpdatePeriodically() async {
    _timer ??= Timer.periodic(
      Duration(seconds: periodicTimeInSeconds),
      (_) async {
        await doImmediateOperationOnDB();
      },
    );
  }

  @override
  Future<void> doImmediateOperationOnDB() async {
    final copiedTaskQueue = Queue.of(_taskQueue);
    _taskQueue.clear();
    final futures = <Future>[];

    while (copiedTaskQueue.isNotEmpty) {
      final task = copiedTaskQueue.removeFirst();

      // It means it has been completed
      if (task.markForDeletion) {
        futures.add(_localCacheHandler.deleteTask(task: task));
      } else {
        futures.add(_localCacheHandler.updateTask(task: task));
      }
    }

    await Future.wait(futures);
  }

  @override
  void dispose() {
    _timer?.cancel();
  }
}
