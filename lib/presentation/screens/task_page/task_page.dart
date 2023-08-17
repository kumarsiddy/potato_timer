import 'package:flutter/material.dart';
import 'package:potato_timer/applications/task/task_store.dart';
import 'package:potato_timer/presentation/core/base/base_stateless_widget.dart';
import 'package:potato_timer/presentation/core/base/size_config.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';
import 'package:potato_timer/utils/utils.dart';

part 'task_page_ui.dart';

class TaskPage extends BaseStatelessWidget<TaskStore> {
  TaskPage({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: _TaskPageUI(),
      appBar: CustomAppBar.primary(
        stringKey: StringKey.addTask,
      ),
    );
  }
}
