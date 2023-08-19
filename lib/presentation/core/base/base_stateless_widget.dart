import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_timer/applications/base/base_store.dart';
import 'package:potato_timer/di/injection.dart';
import 'package:potato_timer/domain/models/models.dart';
import 'package:potato_timer/presentation/core/base/size_config.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';
import 'package:potato_timer/utils/app_utils.dart';
import 'package:potato_timer/utils/string_keys.dart';
import 'package:potato_timer/utils/typedef.dart';
import 'package:provider/provider.dart';

part '../../design_library/screens/no_internet_page.dart';

part 'base_stateful_widget.dart';

abstract class BaseStatelessWidget<T extends BaseStore> extends StatelessWidget
    with RouteAware {
  BaseStatelessWidget({super.key});

  late final T childStore = _getStore();
  late final ReactionDisposer _exceptionReactionDispose;

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
      storeOf<T>(context).init(args);
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

    _registerExceptionReaction(context);
  }

  Future<void> _registerExceptionReaction(
    BuildContext context,
  ) async {
    _exceptionReactionDispose = reaction(
      (_) => childStore.appException,
      (appException) {
        if (context.mounted && isCurrentScreen(context)) {
          showErrorSnackbar(context, appException!.message);
        }
      },
    );
  }

  /// This method will be called when widget will be destroyed
  Future<void> onDestroy(
    BuildContext context,
  ) async {
    _exceptionReactionDispose();
    childStore.dispose();
  }

  Widget buildScreen(BuildContext context);

  // This method [_getStore] will automatically will get the MobX Store
  // using get_it and this will get inserted into the widget tree
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
