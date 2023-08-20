import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:potato_timer/config/di/injection.dart';

import 'injection.config.dart';

const _test = 'test';

@InjectableInit(generateForDir: ['lib', _test])
GetIt configureTestInjection(String env) => getIt.init(
      environment: env,
    );
