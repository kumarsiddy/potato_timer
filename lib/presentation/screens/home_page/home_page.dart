import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato_timer/applications/home_page/home_page_store.dart';
import 'package:potato_timer/presentation/core/base/base_stateless_widget.dart';
import 'package:potato_timer/presentation/core/base/size_config.dart';
import 'package:potato_timer/presentation/core/router/router.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';
import 'package:potato_timer/utils/app_utils.dart';
import 'package:potato_timer/utils/string_keys.dart';

part 'home_page_ui.dart';

class HomePage extends BaseStatelessWidget<HomePageStore> {
  HomePage({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: _HomePageUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTaskPage(context),
        child: const Icon(Icons.add),
      ),
      appBar: CustomAppBar.noBackButton(
        stringKey: StringKey.potatoTimer,
      ),
    );
  }

  Future<void> _openTaskPage(
    BuildContext context,
  ) async {
    RouteHandler.navigateTo(
      context,
      routeId: RouteId.taskPage,
    );
  }
}
