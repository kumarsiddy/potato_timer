import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// This class will be used to keep track of
/// lifecycle of the app
class AppLifeCycleObserver extends WidgetsBindingObserver {
  AppLifeCycleObserver({
    required this.onPause,
    required this.onResume,
    required this.onInactive,
    required this.onDetached,
  });

  final AsyncCallback onPause;
  final AsyncCallback onResume;
  final AsyncCallback onInactive;
  final AsyncCallback onDetached;

  @override
  Future<void> didChangeAppLifecycleState(
    AppLifecycleState state,
  ) async {
    switch (state) {
      case AppLifecycleState.paused:
        onPause();
      case AppLifecycleState.resumed:
        onResume();
      case AppLifecycleState.inactive:
        onInactive();
      case AppLifecycleState.detached:
        onDetached();
    }
  }
}
