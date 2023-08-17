import 'package:flutter/material.dart';
import 'package:potato_timer/presentation/core/router/router.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';

/// This key [globalNavigatorKey] is created to be used for showing
/// snackbar/toast and sometimes for showing a dialog
final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

class PotatoTimerApp extends StatelessWidget {
  const PotatoTimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _getCustomThemeData(),
        navigatorKey: globalNavigatorKey,
        title: 'Potato Timer',
        onGenerateRoute: RouteHandler.generateRoute,
        initialRoute: RouteId.splash.name,
      ),
    );
  }
}

ThemeData _getCustomThemeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary.value,
    ),
    useMaterial3: true,
  );
}
