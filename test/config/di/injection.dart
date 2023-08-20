import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

const _test = 'test';

final getIt = GetIt.instance;

@InjectableInit(
  generateForDir: ['test', _test],
  preferRelativeImports: true,
)
GetIt configureTestInjection(String env) => getIt.init(
      environment: env,
    );
