import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';
import 'package:potato_timer/utils/image_assets.dart';

abstract class _BaseImage extends StatelessWidget {
  final ImageAsset imageAsset;
  final double height;
  final double width;

  const _BaseImage({
    Key? key,
    required this.imageAsset,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Uri.tryParse(imageAsset.path)?.hasAbsolutePath ?? false) {
      if (imageAsset.path.endsWith('.svg')) {
        return SvgPicture.network(
          imageAsset.path,
          height: height,
          width: width,
        );
      }

      return Image.network(
        imageAsset.path,
        height: height,
        width: width,
      );
    }

    if (imageAsset.path.endsWith('.svg')) {
      return SvgPicture.asset(
        imageAsset.path,
        height: height,
        width: width,
      );
    }

    return Image.asset(
      imageAsset.path,
      height: height,
      width: width,
    );
  }
}

class AppImage extends _BaseImage {
  const AppImage({
    super.key,
    required super.imageAsset,
    required super.height,
    double? width,
  }) : super(
          width: width ?? height,
        );

  factory AppImage.dialogIcon({
    required final ImageAsset imageAsset,
  }) {
    return AppImage(
      imageAsset: imageAsset,
      height: 64.r,
      width: 64.r,
    );
  }

  factory AppImage.snackIcon({
    required final ImageAsset imageAsset,
  }) {
    return AppImage(
      imageAsset: imageAsset,
      height: 36.r,
      width: 36.r,
    );
  }
}
