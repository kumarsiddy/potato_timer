import 'package:flutter/material.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';
import 'package:potato_timer/utils/app_asset_source.dart';

abstract class _BaseImage extends StatelessWidget {
  const _BaseImage({
    Key? key,
    required this.assetSource,
    required this.height,
    required this.width,
  }) : super(key: key);

  final AppAssetSource assetSource;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    if (Uri.tryParse(assetSource.path)?.hasAbsolutePath ?? false) {
      return Image.network(
        assetSource.path,
        height: height,
        width: width,
      );
    }

    return Image.asset(
      assetSource.path,
      height: height,
      width: width,
    );
  }
}

class AppImage extends _BaseImage {
  const AppImage({
    super.key,
    required super.assetSource,
    required super.height,
    double? width,
  }) : super(
          width: width ?? height,
        );

  factory AppImage.dialogIcon({
    required final AppAssetSource assetSource,
  }) {
    return AppImage(
      assetSource: assetSource,
      height: 64.r,
      width: 64.r,
    );
  }

  factory AppImage.snackIcon({
    required final AppAssetSource assetSource,
  }) {
    return AppImage(
      assetSource: assetSource,
      height: 36.r,
      width: 36.r,
    );
  }
}
