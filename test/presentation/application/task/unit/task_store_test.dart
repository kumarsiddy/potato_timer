import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:potato_timer/presentation/applications/task/task_store.dart';

import '../../../../config/di/test_injection.dart';
import '../../../../config/test_config.dart';
import '../../../../config/test_config.mocks.dart';

void main() {
  late final TaskStore store;

  setUpAll(
    () async {
      await init();

      final connectionAwareFacade = getIt<MockIConnectionAwareFacade>();
      final handler = getIt<MockILocalCacheHandler>();

      store = TaskStore(
        connectionAwareFacade,
        handler,
      );

      when(handler.addTask(task: anyNamed('task'))).thenAnswer(
        (_) async => Future.value(right(true)),
      );
    },
  );

  group(
    'Task Store Unit Testing',
    () {
      test(
        'Test Title input field',
        () async {
          // Checking invalid input
          store.onTaskNameChange('sidy');
          expect(store.taskTitleValueObject?.isValid, false);

          // Checking valid input
          store.onTaskNameChange('valid input');
          expect(store.taskTitleValueObject?.isValid, true);
        },
      );

      test(
        'Test Description input field',
        () async {
          // Checking invalid input
          store.onTaskDescriptionChange('sidy');
          expect(store.taskDescriptionValueObject?.isValid, false);

          // Checking valid input
          store.onTaskDescriptionChange('valid description');
          expect(store.taskDescriptionValueObject?.isValid, true);
        },
      );

      test(
        'Test Duration input field',
        () async {
          // Checking Hour 0 <= hour <= 24
          // Checking invalid input
          store.onHourChange('sidy');
          expect(store.hourValueObject?.isValid, false);
          // Checking invalid input
          store.onHourChange('35');
          expect(store.hourValueObject?.isValid, false);
          // Checking valid input
          store.onHourChange('21');
          expect(store.hourValueObject?.isValid, true);

          // Checking Minute 0 <= minute <= 60
          // Checking invalid input
          store.onMinuteChange('sidy');
          expect(store.minuteValueObject?.isValid, false);
          // Checking invalid input
          store.onMinuteChange('95');
          expect(store.minuteValueObject?.isValid, false);
          // Checking valid input
          store.onMinuteChange('12');
          expect(store.minuteValueObject?.isValid, true);

          // Checking Second 0 <= second <= 60
          // Checking invalid input
          store.onSecondChange('sidy');
          expect(store.secondValueObject?.isValid, false);
          // Checking invalid input
          store.onSecondChange('95');
          expect(store.secondValueObject?.isValid, false);
          // Checking valid input
          store.onSecondChange('12');
          expect(store.secondValueObject?.isValid, true);

          // Checking for Duration
          store
            ..onHourChange('0')
            ..onMinuteChange('0')
            ..onSecondChange('0');
          expect(store.validTask, false);
          store
            ..onHourChange('12')
            ..onMinuteChange('48')
            ..onSecondChange('39');
          expect(store.validTask, true);
        },
      );

      test(
        'Test Adding Task',
        () async {
          // Populating the data
          store
            ..onTaskNameChange('Turn off Geyser')
            ..onTaskDescriptionChange(
              'Do you want to burn ? Be Lazy : Turn off Geyser',
            )
            ..onHourChange('0')
            ..onMinuteChange('15')
            ..onSecondChange('30');

          // Perform action
          await store.onAddTaskButtonClick();
          expect(store.taskSaved, true);
          expect(store.loading, false);
        },
      );
    },
  );
}
