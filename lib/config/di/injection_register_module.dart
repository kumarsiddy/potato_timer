import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';
import 'package:potato_timer/config/config_options.dart';
import 'package:potato_timer/config/env.dart';

@module
abstract class RegisterModule {
  @singleton
  Env get env => configReader.env;

  @injectable
  AudioPlayer get audioPlayer => AudioPlayer();
}
