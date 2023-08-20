import 'package:flutter_test/flutter_test.dart';
import 'package:potato_timer/config/di/injection.dart';
import 'package:potato_timer/presentation/applications/home_page/home_page_store.dart';

import '../../../../config/test_config.dart';

void main() {
  HomePageStore homePageStore() => getIt<HomePageStore>();

  setUpAll(() async {
    await init();
  });
}
