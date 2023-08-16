import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_timer/presentation/presentation/core/router/router.dart';

/// This key [globalNavigatorKey] is created to be used for showing
/// snackbar/toast and sometimes for showing a dialog
final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

class HighlevelApp extends StatelessWidget {
  const HighlevelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        navigatorKey: globalNavigatorKey,
        title: 'Highlevel Assignment',
        navigatorObservers: [],
        onGenerateRoute: RouteHandler.generateRoute,
        initialRoute: RouteId.splash.name,
      ),
    );
  }
}
