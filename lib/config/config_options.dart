import 'package:potato_timer/config/env.dart';

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
