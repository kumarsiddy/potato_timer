import 'package:flutter/material.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';
import 'package:potato_timer/utils/string_keys.dart';

abstract class _BaseAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final StringKey? stringKey;
  final bool? backButtonRequired;
  final Widget? leading;
  final AppColor? backgroundColor;
  final bool? shadow;

  const _BaseAppBar({
    this.stringKey,
    this.backButtonRequired,
    this.leading,
    this.backgroundColor,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppText.titleLarge(
        stringKey ?? StringKey.empty,
        color: AppColor.white,
      ),
      leading: Navigator.canPop(context) && (backButtonRequired == true)
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 18.h,
                color: AppColor.white.value,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBar extends _BaseAppBar {
  const CustomAppBar._({
    StringKey? stringKey,
    bool? backButtonRequired,
    Widget? leading,
    AppColor? backgroundColor,
    bool? shadow,
  }) : super(
          stringKey: stringKey,
          backButtonRequired: backButtonRequired,
          leading: leading,
          backgroundColor: backgroundColor,
          shadow: shadow,
        );

  factory CustomAppBar.noBackButton({
    StringKey? stringKey,
  }) {
    return CustomAppBar._(
      stringKey: stringKey,
      backButtonRequired: false,
    );
  }

  factory CustomAppBar.primary({
    StringKey? stringKey,
  }) {
    return CustomAppBar._(
      stringKey: stringKey,
      backButtonRequired: true,
    );
  }
}
