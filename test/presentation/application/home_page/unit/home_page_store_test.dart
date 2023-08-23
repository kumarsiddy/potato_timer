import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:potato_timer/config/di/injection.dart';
import 'package:potato_timer/presentation/applications/home_page/home_page_store.dart';

import '../../../../config/sample_data.dart';
import '../../../../config/test_config.dart';
import '../../../../config/test_config.mocks.dart';

void main() {
  late final HomePageStore store;

  setUpAll(
    () async {
      // configure testing related stuff
      await init();

      final connectionAwareFacade = getIt<MockIConnectionAwareFacade>();
      final handler = getIt<MockILocalCacheHandler>();
      final taskManager = getIt<MockITaskManager>();
      final audioPlayer = getIt<MockAudioPlayer>();

      store = HomePageStore(
        connectionAwareFacade,
        handler,
        taskManager,
        audioPlayer,
      );

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
    'Home Page Store Unit Testing',
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
