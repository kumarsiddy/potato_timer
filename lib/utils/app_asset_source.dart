enum AppAssetSource {
  soundWave('assets/icons/sound_wave.png'),
  alert('sounds/alert.mp3'),
  pause('assets/icons/pause.png'),
  play('assets/icons/play.png'),
  stop('assets/icons/stop.png'),
  cross('assets/icons/cross.png'),
  tick('assets/icons/tick.png'),
  info('assets/icons/info.png'),
  splash('assets/images/splash.png');

  final String path;

  const AppAssetSource(this.path);
}
