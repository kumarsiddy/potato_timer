part of 'home_page.dart';

class _HomePageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (ctx) {
        return _TaskListView(
          tasks: storeOf<HomePageStore>(ctx).tasks.toList(),
        );
      },
    );
  }
}

class _TaskListView extends StatelessWidget {
  const _TaskListView({
    required this.tasks,
  });

  final List<PotatoTimerTask> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return _TaskItem(task: tasks[index]);
      },
      separatorBuilder: (_, __) {
        return Gap(24.r);
      },
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem({
    required this.task,
  });

  final PotatoTimerTask task;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.offWhite.value,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (task.finished)
            _TaskCompletionView()
          else
            _TaskInteractionView(
              task: task,
            ),
          Gap(4.r),
          Padding(
            padding: EdgeInsets.only(top: 12.r, left: 24.r),
            child: AppText.headlineSmall(text: task.title),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.r),
            child: AppText.bodyMedium(text: task.description),
          ),
          Gap(12.r),
          if (task.finished)
            AppButton.filledButton(
              StringKey.markComplete,
              onPressed: () => storeOf<HomePageStore>(context).stopTask(task),
            )
          else
            Gap(24.r),
        ],
      ),
    );
  }
}

class _TaskInteractionView extends StatelessWidget {
  const _TaskInteractionView({
    required this.task,
  });

  final PotatoTimerTask task;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _DurationView(elapsedSeconds: task.elapsedSeconds),
        _InteractiveButtons(task),
      ],
    );
  }
}

class _DurationView extends StatelessWidget {
  const _DurationView({
    required this.elapsedSeconds,
  });

  final int elapsedSeconds;

  @override
  Widget build(BuildContext context) {
    final (hours, minutes, seconds) = getFormattedTimeFrom(
      elapsedTimeInSecond: elapsedSeconds,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.headlineMedium(text: hours),
        AppText.headlineMedium(text: ' : '),
        AppText.headlineMedium(text: minutes),
        AppText.headlineMedium(text: ' : '),
        AppText.headlineMedium(text: seconds),
      ],
    );
  }
}

class _InteractiveButtons extends StatelessWidget {
  const _InteractiveButtons(this.task);

  final PotatoTimerTask task;

  @override
  Widget build(BuildContext context) {
    final store = storeOf<HomePageStore>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => store.togglePauseResumeTask(task),
              icon: ImageIcon(
                task.paused
                    ? AssetImage(AppAssetSource.play.path)
                    : AssetImage(AppAssetSource.pause.path),
              ),
            ),
            IconButton(
              onPressed: () => store.stopTask(task),
              icon: ImageIcon(
                AssetImage(AppAssetSource.stop.path),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _TaskCompletionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppImage(
          assetSource: AppAssetSource.soundWave,
          height: 64.h,
        ),
        Gap(16.r),
        AppText.headlineLarge(stringKey: StringKey.finished),
        Gap(16.r),
        AppImage(
          assetSource: AppAssetSource.soundWave,
          height: 64.h,
        ),
      ],
    );
  }
}
