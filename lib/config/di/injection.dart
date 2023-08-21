import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:potato_timer/config/di/injection.config.dart';
import 'package:potato_timer/config/env.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies(Env env) => getIt.init(
      environment: env.name,
    );