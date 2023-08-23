import 'package:injectable/injectable.dart';

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
}
