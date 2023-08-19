import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_timer/applications/base/base_store.dart';
import 'package:potato_timer/domain/i_local_cache_handler.dart';
import 'package:potato_timer/domain/i_task_manager.dart';
import 'package:potato_timer/domain/models/models.dart';

part 'home_page_store.g.dart';

@injectable
class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore extends BaseStore with Store {
  _HomePageStore(
    super.connectionAwareFacade,
    this._localCacheHandler,
    this._taskManager,
  );

  final ILocalCacheHandler _localCacheHandler;
  final ITaskManager _taskManager;
  Timer? _timer;

  @observable
  ObservableList<PotatoTimerTask> tasks = ObservableList<PotatoTimerTask>();

  @override
  Future<void> init(
    Map<String, dynamic>? args,
  ) async {
    await _getAllTasks();
    _runTimerOnTask();
    return super.init(args);
  }

  @action
  Future<void> _getAllTasks() async {
    showLoader();

    final allTasksOrFailure = await _localCacheHandler.getAllSavedTasks();
    allTasksOrFailure.fold(
      handleException,
      (result) {
        // clearing if any data is before there
        // then adding it
        tasks
          ..clear()
          ..addAll(result);
        hideLoader();
      },
    );
  }

  @action
  void _runTimerOnTask() {
    _timer ??= Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        final modifiedTasks = tasks.map(_modifyAndMarkTask).toList();
        tasks
          ..clear()
          ..addAll(modifiedTasks);
      },
    );
  }

  PotatoTimerTask _modifyAndMarkTask(
    PotatoTimerTask task,
  ) {
    final finished = task.elapsedSeconds == 0;
    final paused = task.paused;

    final modifiedTask = task.copyWith(
      finished: finished,
      elapsedSeconds: finished
          ? 0
          : paused
              ? task.elapsedSeconds
              : task.elapsedSeconds - 1,
    );

    if (finished) {
      _removeTask(task.id!);
    }
    // Marking for update, and sending it to taskManager
    _taskManager.addToQueue(modifiedTask);

    return modifiedTask;
  }

  @action
  void togglePauseResumeOnTask(
    PotatoTimerTask task,
  ) {
    final index = tasks.indexWhere((element) => element.id == task.id);
    tasks[index] = task.copyWith(paused: !task.paused);
  }

  @action
  void stopTask(
    PotatoTimerTask task,
  ) {
    _removeTask(task.id!);
    // Sending this task to Queue
    _taskManager.addToQueue(task.copyWith(finished: true));
  }

  void _removeTask(int id) {
    tasks.removeWhere((element) => element.id == id);
  }

  @override
  Future<void> dispose() {
    _timer?.cancel();
    return super.dispose();
  }
}
