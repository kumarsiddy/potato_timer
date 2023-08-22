import 'package:potato_timer/config/env.dart';

/// This class [IConfigs] is the base class for all environments
/// defined in the app. This will contain all app + environment related
/// constant values
abstract class IConfigs {
  IConfigs._();

  late Env env;
}

class UatConfigs implements IConfigs {
  @override
  Env env = const Env(uat);
}

class ProdConfigs implements IConfigs {
  @override
  Env env = const Env(prod);
}

IConfigs configReader = UatConfigs();

void initConfigReader(Env env) {
  switch (env.name) {
    case uat:
      configReader = UatConfigs();
      break;
    case prod:
      configReader = ProdConfigs();
      break;
  }
}
