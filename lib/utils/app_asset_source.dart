enum AppAssetSource {
  soundWave('assets/icons/sound_wave.png'),
  alert('sounds/alert.mp3'),
  pause('assets/icons/pause.png'),
  play('assets/icons/play.png'),
  stop('assets/icons/stop.png'),
  cross('assets/icons/cross.svg'),
  tick('assets/icons/tick.svg'),
  info('assets/icons/info.svg'),
  splash('assets/images/splash.svg');

  final String path;

  const AppAssetSource(this.path);
}
