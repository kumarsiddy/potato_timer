import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potato_timer/config/di/injection.dart';
import 'package:potato_timer/config/env.dart';
import 'package:potato_timer/presentation/view/core/potato_timer_app.dart';

Future<void> mainCommon(Env env) async {
  runZonedGuarded<Future<void>>(
    () async {
      // Call this if the main method is asynchronous
      WidgetsFlutterBinding.ensureInitialized();

      // Configuring dependencies when app starts
      configureDependencies(env);

      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      ).then(
        (_) {
          runApp(
            const PotatoTimerApp(),
          );
        },
      );
    },
    (error, stack) async {
      // We can log the crash from here
    },
  );
}
