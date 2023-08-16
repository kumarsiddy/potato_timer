import 'package:flutter/material.dart';
import 'package:potato_timer/applications/base/base_store.dart';
import 'package:potato_timer/applications/splash/splash_store.dart';
import 'package:potato_timer/di/injection.dart';
import 'package:potato_timer/presentation/core/base/base_stateless_widget.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';
import 'package:potato_timer/utils/image_assets.dart';

part 'splash_ui.dart';

class SplashPage extends BaseStatelessWidget {
  SplashPage({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _SplashUI(),
      ),
    );
  }

  @override
  BaseStore getImplementedStore() {
    return getIt<SplashStore>();
  }
}
