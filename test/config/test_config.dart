import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> init() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  _setupConnectivityPlusMock();
  _setupAudioPlayersMock();
  _setupPathProviderMock();
}

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
