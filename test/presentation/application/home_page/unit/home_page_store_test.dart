import 'package:audioplayers/audioplayers.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:potato_timer/domain/i_local_cache_handler.dart';
import 'package:potato_timer/domain/i_task_manager.dart';
import 'package:potato_timer/presentation/applications/home_page/home_page_store.dart';

import '../../../../config/fake_fallback_values.dart';
import '../../../../config/sample_data.dart';
import '../../../../config/test_config.dart';
import '../../../../infrastructure/mock_audio_player.dart';
import '../../../../infrastructure/mock_local_cache_handler.dart';

void main() {
  late final HomePageStore mockHomePageStore;
  late final ITaskManager mockTaskManager;
  late final ILocalCacheHandler mockLocalCacheHandler;
  late final MockAudioPlayer mockAudioPlayer;

  setUpAll(() async {
    await init();
  });

  group(
    'description',
    () {
      mockLocalCacheHandler = MockLocalCacheHandler();
      // mockTaskManager = getIt<ITaskManager>();
      mockAudioPlayer = MockAudioPlayer();

      // mockHomePageStore = getIt<HomePageStore>();

      when(
        () => mockLocalCacheHandler.getAllSavedTasks(),
      ).thenAnswer(
        (invocation) => Future.value(right(mockTaskData)),
      );

      when(
        () => mockAudioPlayer.setSource(FakeAssetSource()),
      ).thenAnswer(
        (invocation) async {},
      );
      when(() => mockAudioPlayer.setReleaseMode(ReleaseMode.loop)).thenAnswer(
        (invocation) async {},
      );
      when(() => mockAudioPlayer.setPlayerMode(PlayerMode.lowLatency))
          .thenAnswer(
        (invocation) async {},
      );

      // test(
      //   'init method call testing',
      //   () async {
      //     mockHomePageStore.init();
      //
      //     verify(() => mockHomePageStore.init()).called(1);
      //   },
      // );
    },
  );
}
