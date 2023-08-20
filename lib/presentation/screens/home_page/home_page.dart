import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:potato_timer/applications/home_page/home_page_store.dart';
import 'package:potato_timer/domain/models/models.dart';
import 'package:potato_timer/presentation/core/base/base_stateless_widget.dart';
import 'package:potato_timer/presentation/core/router/router.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';
import 'package:potato_timer/presentation/design_library/widgets/app_button.dart';
import 'package:potato_timer/utils/utils.dart';

part 'home_page_ui.dart';

class HomePage extends BaseStatelessWidget<HomePageStore> {
  HomePage({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.r,
          vertical: 24.r,
        ),
        child: _HomePageUI(),
      ),
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
    await RouteHandler.navigateTo(
      context,
      routeId: RouteId.taskPage,
    );

    // Calling init method as soon as it will come back from
    // add Task screen
    storeOf<HomePageStore>(context).init();
  }
}
