import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_timer/domain/i_local_cache_handler.dart';
import 'package:potato_timer/domain/i_task_manager.dart';
import 'package:potato_timer/domain/models/models.dart';
import 'package:potato_timer/presentation/applications/base/base_store.dart';
import 'package:potato_timer/utils/utils.dart';

part 'home_page_store.g.dart';

@injectable
class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore extends BaseStore with Store {
  _HomePageStore(
    super.connectionAwareFacade,
    this._localCacheHandler,
    this._taskManager,
    this._audioPlayer,
  );

  final ILocalCacheHandler _localCacheHandler;
  final ITaskManager _taskManager;
  final AudioPlayer _audioPlayer;

  ReactionDisposer? _audioReaction;
  Timer? _timer;

  @observable
  ObservableList<PotatoTimerTask> tasks = ObservableList<PotatoTimerTask>();

  @override
  Future<void> init([
    Map<String, dynamic>? args,
  ]) async {
    await Future.wait([
      _initAudioPlayer(),
      _fetchAllSavedTasks(),
    ]);
    _initAudioReaction();
    _runCountDownTimerOnTask();
    return super.init(args);
  }

  Future<void> _initAudioPlayer() async {
    await _audioPlayer.setSource(AssetSource(AppAssetSource.alert.path));
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.setPlayerMode(PlayerMode.lowLatency);
  }

  @action
  Future<void> _fetchAllSavedTasks() async {
    showLoader();

    final allTasksOrFailure = await _localCacheHandler.getAllSavedTasks();
    allTasksOrFailure.fold(
      handleException,
      (result) {
        // clearing if any data is before there
        // then adding it
        tasks = ObservableList.of(result);
        hideLoader();
      },
    );
  }

  void _initAudioReaction() {
    _audioReaction ??= reaction(
      (_) => tasks.asObservable(),
      (_) {
        final isAnyFinishedTask = tasks.toList().any(
              (element) => element.finished,
            );

        if (isAnyFinishedTask) {
          _playAlert();
        }
      },
    );
  }

  @action
  void _runCountDownTimerOnTask() {
    _timer ??= Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        final modifiedTasks = tasks.map(
          (task) {
            final modifiedTask = _getModifiedTask(task);
            // Marking for update, and sending it to taskManager
            // to be taken care in next set of batch update
            _taskManager.addToQueue(task);
            return modifiedTask;
          },
        ).toList()
          ..sort(PotatoTimerTask.compareTaskBasedOnTimeLeft);

        tasks = ObservableList.of(modifiedTasks);
      },
    );
  }

  PotatoTimerTask _getModifiedTask(
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

    return modifiedTask;
  }

  @action
  void _doOperationOnTask(
    PotatoTimerTask task,
  ) {
    // If task is finished, send it to top
    if (task.finished) {
      _removeTask(task.id!);
      tasks.insert(0, task);
    }
  }

  @action
  void togglePauseResumeTask(
    PotatoTimerTask task,
  ) {
    final index = tasks.indexWhere((element) => element.id == task.id);
    tasks[index] = task.copyWith(paused: !task.paused);
  }

  @action
  Future<void> stopTask(
    PotatoTimerTask task,
  ) async {
    _removeTask(task.id!);
    // Sending this task to Queue
    _taskManager.addToQueue(
      task.copyWith(
        finished: true,
        markForDeletion: true,
      ),
    );
    await _pauseAlert();
  }

  void _removeTask(int id) {
    tasks.removeWhere((element) => element.id == id);
  }

  Future<void> _playAlert() async {
    await _audioPlayer?.resume();
  }

  Future<void> _pauseAlert() async {
    await _audioPlayer?.pause();
  }

  @override
  Future<void> dispose() async {
    _timer?.cancel();
    await _audioPlayer.dispose();
    _audioReaction?.call();
    return super.dispose();
  }
}
