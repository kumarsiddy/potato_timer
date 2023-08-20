import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@Injectable(env: [Environment.test])
class MockAudioPlayer extends Mock implements AudioPlayer {}
