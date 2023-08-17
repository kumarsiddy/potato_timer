import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_timer/applications/splash/splash_store.dart';
import 'package:potato_timer/di/injection.dart';
import 'package:potato_timer/presentation/core/base/base_stateless_widget.dart';
import 'package:potato_timer/presentation/core/base/size_config.dart';
import 'package:potato_timer/presentation/core/router/router.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';
import 'package:potato_timer/utils/app_utils.dart';
import 'package:potato_timer/utils/image_assets.dart';
import 'package:potato_timer/utils/string_keys.dart';

part 'splash_ui.dart';

class SplashPage extends BaseStatelessWidget<SplashStore> {
  SplashPage({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: _SplashUI(),
    );
  }

  @override
  SplashStore getImplementedStore() {
    return getIt<SplashStore>();
  }

  @override
  Future<void> onStart(
    BuildContext context,
    Map<String, dynamic>? args,
  ) async {
    _registerReactions(context);
    return super.onStart(context, args);
  }

  void _registerReactions(
    BuildContext context,
  ) {
    when(
      (_) => getStore<SplashStore>(context).loaded,
      () => RouteHandler.navigateToOnly(
        context,
        routeId: RouteId.homePage,
      ),
    );
  }
}
