import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potato_timer/presentation/presentation/core/base/size_config.dart';
import 'package:potato_timer/presentation/presentation/core/design_library/app_colors.dart';

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
        color: AppColors.primaryDark,
        size: 48.h,
      ),
    );
  }
}
