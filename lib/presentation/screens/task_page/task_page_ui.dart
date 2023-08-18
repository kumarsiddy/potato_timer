part of 'task_page.dart';

class _TaskPageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ParentWrapperWidget(
      height: SizeConfig.safeAreaScreenHeightWithoutToolbar,
      child: Observer(
        builder: (context) {
          final store = storeOf<TaskStore>(context);

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextForm.taskTitle(
                store.taskNameValueObject,
                onChanged: store.onTaskNameChange,
                labelTextKey: StringKey.title,
                hintTextKey: StringKey.sampleTitle,
                errorTextKey: StringKey.invalidTitle,
              ),
              Gap(32.r),
              AppTextForm.taskDescription(
                store.taskDescriptionValueObject,
                onChanged: store.onTaskDescriptionChange,
                labelTextKey: StringKey.description,
                hintTextKey: StringKey.sampleDescription,
                errorTextKey: StringKey.invalidDescription,
              ),
              Gap(32.r),
              _DurationSelectorWidget(),
            ],
          );
        },
      ),
    );
  }
}

class _DurationSelectorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (ctx) {
      final store = storeOf<TaskStore>(context);

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.bodyMedium(StringKey.duration),
          Gap(8.r),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: AppTextForm.duration(
                  store.hourValueObject,
                  onChanged: store.onHourChange,
                  labelTextKey: StringKey.hh,
                  hintTextKey: StringKey.durationHint,
                ),
              ),
              Gap(8.r),
              Flexible(
                child: AppTextForm.duration(
                  store.minuteValueObject,
                  onChanged: store.onMinuteChange,
                  labelTextKey: StringKey.mm,
                  hintTextKey: StringKey.durationHint,
                ),
              ),
              Gap(8.r),
              Flexible(
                child: AppTextForm.duration(
                  store.secondValueObject,
                  onChanged: store.onSecondChange,
                  labelTextKey: StringKey.ss,
                  hintTextKey: StringKey.durationHint,
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
