import 'package:audioplayers/audioplayers.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:potato_timer/domain/i_connection_aware_facade.dart';
import 'package:potato_timer/domain/i_local_cache_handler.dart';
import 'package:potato_timer/domain/i_task_manager.dart';
import 'package:potato_timer/infrastructure/database/app_database.dart';
import 'package:potato_timer/presentation/applications/home_page/home_page_store.dart';

import '../../../../config/sample_data.dart';
import '../../../../config/test_config.dart';
import 'home_page_store_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AudioPlayer>(),
  MockSpec<IConnectionAwareFacade>(),
  MockSpec<ILocalCacheHandler>(),
  MockSpec<ITaskManager>(),
  MockSpec<AppDatabase>(),
])
void main() {
  late final MockIConnectionAwareFacade connectionAwareFacade;
  late final MockILocalCacheHandler handler;
  late final ITaskManager taskManager;
  late final HomePageStore store;

  setUpAll(
    () async {
      connectionAwareFacade = MockIConnectionAwareFacade();
      handler = MockILocalCacheHandler();
      taskManager = MockITaskManager();

      final audioPlayer = MockAudioPlayer();

      store = HomePageStore(
        connectionAwareFacade,
        handler,
        taskManager,
        audioPlayer,
      );

      await init();
      when(handler.getAllSavedTasks()).thenAnswer(
        (_) => Future.value(right(sampleTaskData)),
      );

      when(audioPlayer.setSource(any)).thenAnswer(
        (_) async => {},
      );

      when(audioPlayer.setReleaseMode(any)).thenAnswer(
        (_) async => {},
      );

      when(audioPlayer.setPlayerMode(any)).thenAnswer(
        (_) async => {},
      );
    },
  );

  group(
    'description',
    () {
      test(
        'Init Method Testing on tasks',
        () async {
          await store.init();
          expect(store.tasks.isNotEmpty, true);
        },
      );

      test(
        'Test toggle Pause/Resume',
        () async {
          store.togglePauseResumeTask(store.tasks[0]);
          expect(store.tasks[0].paused, true);
          store.togglePauseResumeTask(store.tasks[0]);
          expect(store.tasks[0].paused, false);

          store.togglePauseResumeTask(store.tasks[1]);
          expect(store.tasks[1].paused, true);
          store.togglePauseResumeTask(store.tasks[1]);
          expect(store.tasks[1].paused, false);
        },
      );

      test(
        'Test stopping the task, Eventually will remove the task from list',
        () async {
          var length = store.tasks.length;
          store.stopTask(store.tasks[0]);
          expect(store.tasks.length, length - 1);

          length = store.tasks.length;
          store.stopTask(store.tasks[0]);
          expect(store.tasks.length, length - 1);
        },
      );
    },
  );
}
