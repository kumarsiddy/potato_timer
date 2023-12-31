import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_timer/presentation/applications/splash/splash_store.dart';
import 'package:potato_timer/presentation/view/core/base/base_stateless_widget.dart';
import 'package:potato_timer/presentation/view/core/base/size_config.dart';
import 'package:potato_timer/presentation/view/core/router/router.dart';
import 'package:potato_timer/presentation/view/design_library/design_library.dart';
import 'package:potato_timer/utils/utils.dart';

part 'splash_page_ui.dart';

class SplashPage extends BaseStatelessWidget<SplashStore> {
  SplashPage({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: _SplashUI(),
    );
  }

  @override
  Future<void> onStart(
    BuildContext context,
  ) async {
    _registerReactions(context);
    return super.onStart(context);
  }

  void _registerReactions(
    BuildContext context,
  ) {
    when(
      (_) => storeOf<SplashStore>(context).loaded,
      () => RouteHandler.navigateToOnly(
        context,
        routeId: RouteId.homePage,
      ),
    );
  }
}
