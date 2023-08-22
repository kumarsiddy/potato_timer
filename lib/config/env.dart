/// Environment defined for the app
class Env {
  const Env(this.name);

  final String name;
}

const uat = 'uat';
const prod = 'prod';

const List<String> injectionEnv = [uat, prod];
