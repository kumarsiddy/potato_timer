import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_timer/presentation/applications/task/task_store.dart';
import 'package:potato_timer/presentation/view/core/base/base_stateless_widget.dart';
import 'package:potato_timer/presentation/view/core/base/size_config.dart';
import 'package:potato_timer/presentation/view/core/router/router.dart';
import 'package:potato_timer/presentation/view/design_library/design_library.dart';
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

  @override
  Future<void> onStart(BuildContext context) async {
    await _registerTaskSavedReaction(context);
    return super.onStart(context);
  }

  Future<void> _registerTaskSavedReaction(
    BuildContext context,
  ) async {
    when(
      (_) => storeOf<TaskStore>(context).taskSaved,
      () async {
        await showInfoSnackbar(context, 'Successfully Saved');
        RouteHandler.pop(context);
      },
    );
  }
}
