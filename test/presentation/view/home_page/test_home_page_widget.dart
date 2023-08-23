import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/mockito.dart';
import 'package:potato_timer/config/di/injection.dart';
import 'package:potato_timer/presentation/applications/home_page/home_page_store.dart';
import 'package:potato_timer/presentation/view/core/router/router.dart';
import 'package:potato_timer/presentation/view/screens/home_page/home_page.dart';
import 'package:potato_timer/utils/string_keys.dart';

import '../../../config/sample_data.dart';
import '../../../config/test_config.dart';

void main() {
  setUpAll(
    () async {
      init();

      final store = getIt<HomePageStore>();

      when(store.tasks).thenReturn(mobx.ObservableList.of(sampleTaskData));
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
    'Home Page Widget Test',
    () {
      testWidgets(
        'Checking if App bar showing correct title',
        (tester) async {
          final homePage = HomePage();
          await tester.pumpWidget(makeTestableWidget(child: homePage));

          final isAppBarTitleVisible = find.text(StringKey.potatoTimer.value);
          expect(isAppBarTitleVisible, findsOneWidget);
        },
      );

      testWidgets(
        'Checking if FAB (Button to add task) is visible',
        (tester) async {
          final homePage = HomePage();
          await tester.pumpWidget(makeTestableWidget(child: homePage));

          final addTaskFab = find.byIcon(Icons.add);
          expect(addTaskFab, findsOneWidget);
        },
      );
    },
  );
}
