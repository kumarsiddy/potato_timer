import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potato_timer/env.dart';

Future<void> mainCommon(Env env) async {
  runZonedGuarded<Future<void>>(
    () async {
      // Call this if the main method is asynchronous
      WidgetsFlutterBinding.ensureInitialized();

      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      ).then(
        (_) {
          runApp(Container());
        },
      );
    },
    (error, stack) async {
      // We can log the crash from here
    },
  );
}
