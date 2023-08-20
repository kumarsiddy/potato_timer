import 'dart:async';
import 'dart:collection';

import 'package:injectable/injectable.dart';
import 'package:potato_timer/domain/i_local_cache_handler.dart';
import 'package:potato_timer/domain/i_task_manager.dart';
import 'package:potato_timer/domain/models/models.dart';

@Singleton(as: ITaskManager)
class TaskManager implements ITaskManager {
  TaskManager(this._localCacheHandler);

  // periodic time defined in seconds
  static const int _periodicTimeInSeconds = 6;

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
  Future<void> runUpdatePeriodically() async {
    _timer ??= Timer.periodic(
      const Duration(seconds: _periodicTimeInSeconds),
      (_) async {
        await saveImmediatelyToDb();
      },
    );
  }

  @override
  Future<void> saveImmediatelyToDb() async {
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

    Future.wait(futures).then(
      (List results) {
        print('All futures completed successfully');
        print(results);
      },
    ).catchError(
      (error) {
        print('An error occurred: $error');
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
  }
}
