import 'package:injectable/injectable.dart';
import 'package:potato_timer/config_options.dart';
import 'package:potato_timer/env.dart';

@module
abstract class RegisterModule {
  @singleton
  Env get env => configReader.env;
}
