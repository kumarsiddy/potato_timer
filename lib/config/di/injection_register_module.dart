import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';
import 'package:potato_timer/config/config_options.dart';
import 'package:potato_timer/config/env.dart';

/// This class [RegisterModule] register all the object for DI which is either
/// third party or it has only factory method defined
@module
abstract class RegisterModule {
  @singleton
  Env get env => configReader.env;

  @injectable
  AudioPlayer get audioPlayer => AudioPlayer();
}
