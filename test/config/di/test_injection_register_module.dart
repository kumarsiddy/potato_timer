import 'package:injectable/injectable.dart';
import 'package:potato_timer/presentation/applications/home_page/home_page_store.dart';
import 'package:potato_timer/presentation/applications/task/task_store.dart';

import '../test_config.mocks.dart';

/// Add all injectable here you want them to be
/// available in getIt
@module
abstract class TestRegisterModule {
  @injectable
  MockIConnectionAwareFacade get connectionAwareFacade =>
      MockIConnectionAwareFacade();

  @injectable
  MockILocalCacheHandler get localCacheHandler => MockILocalCacheHandler();

  @injectable
  MockITaskManager get taskManager => MockITaskManager();

  @injectable
  MockAudioPlayer get audioPlayer => MockAudioPlayer();

  @singleton
  HomePageStore get homePageStore => MockHomePageStore();

  @singleton
  TaskStore get taskStore => MockTaskStore();
}
