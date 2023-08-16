import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potato_timer/presentation/core/base/size_config.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';

class SpinkitLoader extends StatelessWidget {
  final Color? backgroundColor;

  const SpinkitLoader({
    Key? key,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      color: backgroundColor ?? AppColors.blackTransparent,
      child: SpinKitFadingCircle(
        color: AppColors.primary,
        size: 48.h,
      ),
    );
  }
}
