import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potato_timer/presentation/view/core/base/size_config.dart';
import 'package:potato_timer/presentation/view/design_library/design_library.dart';

class SpinkitLoader extends StatelessWidget {
  const SpinkitLoader({
    Key? key,
    this.backgroundColor,
  }) : super(key: key);
  final AppColor? backgroundColor;

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
