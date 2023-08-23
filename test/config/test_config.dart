import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:potato_timer/domain/i_connection_aware_facade.dart';
import 'package:potato_timer/domain/i_local_cache_handler.dart';
import 'package:potato_timer/domain/i_task_manager.dart';

import 'di/test_injection.dart';

Future<void> init() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  _setupConnectivityPlusMock();
  _setupAudioPlayersMock();
  _setupPathProviderMock();
  configureTestDependencies();
  generateMocks();
}

/// Add all common mocks here which will be used
/// throughout the app testing
@GenerateNiceMocks([
  MockSpec<AudioPlayer>(),
  MockSpec<IConnectionAwareFacade>(),
  MockSpec<ILocalCacheHandler>(),
  MockSpec<ITaskManager>(),
])
void generateMocks() {}

void _setupConnectivityPlusMock() {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('dev.fluttercommunity.plus/connectivity_status'),
    (methodCall) async {
      switch (methodCall.method) {
        case 'listen':
          return null;
        default:
          return null;
      }
    },
  );
}

void _setupAudioPlayersMock() {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('xyz.luan/audioplayers'),
    (methodCall) async {
      switch (methodCall.method) {
        case 'create':
          return null;
        default:
          return null;
      }
    },
  );
}

void _setupPathProviderMock() {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('plugins.flutter.io/path_provider'),
    (methodCall) async {
      switch (methodCall.method) {
        case 'getTemporaryDirectory':
          return '';
        default:
          return null;
      }
    },
  );
}
