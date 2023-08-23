import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:potato_timer/presentation/view/core/router/router.dart';
import 'package:potato_timer/presentation/view/screens/task_page/task_page.dart';
import 'package:potato_timer/utils/utils.dart';

import '../../../config/test_config.dart';

void main() {
  setUpAll(
    () async {
      init();
    },
  );

  Widget makeTestableWidget({
    required Widget child,
  }) {
    return ScreenUtilInit(
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Potato Timer',
        onGenerateRoute: RouteHandler.generateRoute,
        home: child,
      ),
    );
  }

  group(
    'Testing Task Page Widget',
    () {
      testWidgets(
        'Checking if AbbBar has a correct Title',
        (tester) async {
          final taskPage = TaskPage();
          await tester.pumpWidget(makeTestableWidget(child: taskPage));

          final appBarTitle = find.text(StringKey.addTask.value);
          expect(appBarTitle, findsWidgets);
        },
      );

      testWidgets(
        'Checking if task title textFormField is there',
        (tester) async {
          final taskPage = TaskPage();
          await tester.pumpWidget(makeTestableWidget(child: taskPage));

          final titleTextForm = find.text(StringKey.title.value);
          expect(titleTextForm, findsOneWidget);
        },
      );

      testWidgets(
        'Checking if task description textFormField is there',
        (tester) async {
          final taskPage = TaskPage();
          await tester.pumpWidget(makeTestableWidget(child: taskPage));

          final descriptionTextForm = find.text(StringKey.description.value);
          expect(descriptionTextForm, findsOneWidget);
        },
      );

      testWidgets(
        'Checking if hour,minute,second textFormField is there',
        (tester) async {
          final taskPage = TaskPage();
          await tester.pumpWidget(makeTestableWidget(child: taskPage));

          // Hour Widget Test
          final hourTextForm = find.text(StringKey.hh.value);
          expect(hourTextForm, findsOneWidget);

          // Minute Widget Test
          final minuteTextForm = find.text(StringKey.mm.value);
          expect(minuteTextForm, findsOneWidget);

          // Second Widget Test
          final secondTextForm = find.text(StringKey.ss.value);
          expect(secondTextForm, findsOneWidget);
        },
      );

      testWidgets(
        'Checking if Add Task exist and is clickable',
        (tester) async {
          final taskPage = TaskPage();
          await tester.pumpWidget(makeTestableWidget(child: taskPage));

          // Hour Widget Test
          final addTaskButton = find.text(StringKey.addTask.value).last;
          expect(addTaskButton, findsWidgets);
        },
      );
    },
  );
}
