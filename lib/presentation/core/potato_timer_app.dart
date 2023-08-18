import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potato_timer/presentation/core/router/router.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';

/// This key [globalNavigatorKey] is created to be used for showing
/// snackbar/toast and sometimes for showing a dialog
/// It is saved in a GlobalKey only because you don't need to
/// share the context everytime you want to show these popups
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
        theme: _getCustomThemeData(context),
        navigatorKey: globalNavigatorKey,
        title: 'Potato Timer',
        onGenerateRoute: RouteHandler.generateRoute,
        initialRoute: RouteId.splash.name,
      ),
    );
  }
}

ThemeData _getCustomThemeData(
  BuildContext context,
) {
  return ThemeData(
    colorSchemeSeed: AppColor.primary.value,
    useMaterial3: true,
    textTheme: GoogleFonts.latoTextTheme(),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primary.value,
      iconTheme: IconThemeData(color: AppColor.white.value),
      actionsIconTheme: IconThemeData(color: AppColor.white.value),
      centerTitle: false,
      scrolledUnderElevation: 2,
      shadowColor: Theme.of(context).colorScheme.shadow,
    ),
    buttonTheme: const ButtonThemeData(),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hintStyle: GoogleFonts.latoTextTheme().bodyMedium,
      errorStyle: GoogleFonts.latoTextTheme().bodyMedium?.copyWith(
            color: AppColor.red.value,
          ),
      fillColor: AppColor.white.value,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.primary.value,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.grey.value,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.red.value,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.red.value,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
    ),
  );
}
