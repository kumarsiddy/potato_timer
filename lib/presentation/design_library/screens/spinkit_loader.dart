import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potato_timer/presentation/core/base/size_config.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';

class SpinkitLoader extends StatelessWidget {
  final AppColor? backgroundColor;

  const SpinkitLoader({
    Key? key,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      color: backgroundColor?.value ?? AppColor.blackTransparent.value,
      child: SpinKitFadingCircle(
        color: AppColor.primary.value,
        size: 48.h,
      ),
    );
  }
}
