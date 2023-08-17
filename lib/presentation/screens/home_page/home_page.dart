import 'package:flutter/material.dart';
import 'package:potato_timer/applications/home_page/home_page_store.dart';
import 'package:potato_timer/presentation/core/base/base_stateless_widget.dart';
import 'package:potato_timer/presentation/core/base/size_config.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';

part 'home_page_ui.dart';

class HomePage extends BaseStatelessWidget<HomePageStore> {
  HomePage({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: _HomePageUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
