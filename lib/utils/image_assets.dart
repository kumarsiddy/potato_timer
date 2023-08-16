enum ImageAsset {
  cross('assets/icons/cross.svg'),
  tick('assets/icons/tick.svg'),
  info('assets/icons/info.svg'),
  splash('assets/images/splash.svg');

  final String path;

  const ImageAsset(this.path);
}
