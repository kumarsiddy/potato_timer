import 'package:potato_timer/config/env.dart';
import 'package:potato_timer/main.dart';

Future<void> main() async {
  await mainCommon(const Env(prod));
}
