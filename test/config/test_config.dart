import 'package:flutter_test/flutter_test.dart';

import 'di/injection.dart';

const _test = 'test';

Future<void> init() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Setting up Test injection
  configureTestInjection(_test);
}
