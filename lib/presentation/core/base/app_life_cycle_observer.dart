import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// This class will be used to keep track of
/// lifecycle of the app
class AppLifeCycleObserver extends WidgetsBindingObserver {
  AppLifeCycleObserver({
    required this.resumeCallBack,
    required this.suspendingCallBack,
  });

  final AsyncCallback resumeCallBack;
  final AsyncCallback suspendingCallBack;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        await resumeCallBack();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        await suspendingCallBack();
        break;
    }
  }
}
