part of 'task_page.dart';

class _TaskPageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ParentWrapperWidget(
      height: SizeConfig.safeAreaScreenHeightWithoutToolbar,
      child: Column(
        children: [
          Observer(
            builder: (ctx) => AppTextForm.taskName(
              storeOf<TaskStore>(ctx).taskNameValueObject,
              onChanged: storeOf<TaskStore>(context).onTaskNameChange,
              labelTextKey: StringKey.title,
              hintTextKey: StringKey.sampleTitle,
              errorTextKey: StringKey.invalidTitle,
            ),
          ),
        ],
      ),
    );
  }
}
