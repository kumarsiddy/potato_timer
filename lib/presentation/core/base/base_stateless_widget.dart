import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato_timer/applications/base/base_store.dart';
import 'package:potato_timer/di/injection.dart';
import 'package:potato_timer/infrastructure/dtos/dtos.dart';
import 'package:potato_timer/presentation/core/base/app_life_cycle_observer.dart';
import 'package:potato_timer/presentation/core/base/size_config.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';
import 'package:potato_timer/utils/app_utils.dart';
import 'package:potato_timer/utils/string_keys.dart';
import 'package:potato_timer/utils/typedef.dart';
import 'package:provider/provider.dart';

part 'base_stateful_widget.dart';

part 'no_internet_page.dart';

abstract class BaseStatelessWidget<T extends BaseStore> extends StatelessWidget
    with RouteAware {
  late final T childStore = _getStore();

  BaseStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final argsFromPreviousRoute = getArgsFromContext(context);

    return MultiProvider(
      providers: [
        Provider<T>.value(
          value: childStore..init(argsFromPreviousRoute),
        ),
      ],
      child: _BaseStatefulWidget(
        baseStore: childStore,
        onStart: onStart,
        onResume: onResume,
        onSuspend: onSuspend,
        onDestroy: onDestroy,
        onConnectivityChange: onConnectivityChange,
        args: argsFromPreviousRoute,
        builder: buildScreen,
      ),
    );
  }

  Color get statusBarColor => AppColor.white.value;

  bool get forceRefreshOnConnectionChange => false;

  void onConnectivityChange(
    BuildContext context,
    ConnectionStatus status,
  ) {
    if (forceRefreshOnConnectionChange && status.working) {
      final args = getArgsFromContext(context);
      getStore<T>(context).init(args);
    }
  }

  /// This method will be called when widget will be init
  @mustCallSuper
  Future<void> onStart(
    BuildContext context,
  ) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  /// This is lifecycle call for the app, not for this widget
  Future<void> onResume(
    BuildContext context,
  ) async {}

  /// This is lifecycle call for the app, not for this widget
  Future<void> onSuspend(
    BuildContext context,
  ) async {}

  /// This method will be called when widget will be destroyed
  Future<void> onDestroy(
    BuildContext context,
  ) async {
    childStore.dispose();
  }

  Widget buildScreen(BuildContext context);

  /// This method [_getStore] will automatically will get the MobX Store
  /// using get_it and this will get inserted into the widget tree
  T _getStore() {
    return getIt<T>();
  }

  /// Called when the top route has been popped off, and the current route
  /// shows up.
  @override
  void didPopNext() {}

  /// Called when the current route has been pushed.
  @override
  void didPush() {}

  /// Called when the current route has been popped off.
  @override
  void didPop() {}

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  @override
  void didPushNext() {}
}
