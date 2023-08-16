import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:potato_timer/di/injection.config.dart';
import 'package:potato_timer/env.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<GetIt> configureDependencies(Env env) async => getIt.init(
      environment: env.name,
    );
