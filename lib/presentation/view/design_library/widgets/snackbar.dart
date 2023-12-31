import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:potato_timer/presentation/view/design_library/design_library.dart';
import 'package:potato_timer/utils/app_asset_source.dart';
import 'package:potato_timer/utils/typedef.dart';

Flushbar _getFlushBar(
  BuildContext context,
  String message, {
  required AppAssetSource assetSource,
  required AppColor backgroundColor,
  int? durationInSeconds,
  bool? dismissible,
  OnWidgetClickListener? onCloseListener,
}) {
  var buttonClickedFirstTime = false;
  return Flushbar(
    isDismissible: dismissible ?? true,
    message: message,
    icon: AppImage.snackIcon(
      assetSource: assetSource,
    ),
    duration: (dismissible ?? true)
        ? Duration(seconds: durationInSeconds ?? 2)
        : null,
    backgroundColor: backgroundColor.value,
    margin: const EdgeInsets.only(
      left: 16,
      right: 16,
      bottom: 24,
    ),
    padding: const EdgeInsets.all(24),
    borderRadius: BorderRadius.circular(
      19,
    ),
    mainButton: TextButton(
      onPressed: () {
        if (!buttonClickedFirstTime) {
          onCloseListener?.call(context);
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          buttonClickedFirstTime = true;
        }
      },
      child: AppImage(
        assetSource: AppAssetSource.cross,
        height: 15.h,
        width: 15.h,
      ),
    ),
    boxShadows: [
      BoxShadow(
        color: backgroundColor.value.withOpacity(0.8),
        offset: const Offset(0, 2),
        blurRadius: 3,
      ),
    ],
  );
}

Future<void> _show(
  BuildContext context,
  String message, {
  required AppAssetSource assetSource,
  required AppColor backgroundColor,
  int? durationInSeconds,
  bool? dismissible,
  OnWidgetClickListener? onCloseListener,
}) async {
  final flushBar = _getFlushBar(
    context,
    message,
    durationInSeconds: durationInSeconds,
    assetSource: assetSource,
    backgroundColor: backgroundColor,
    dismissible: dismissible,
    onCloseListener: onCloseListener,
  );
  await flushBar.show(context);
}

Future<void> showInfoSnackbar(
  BuildContext context,
  String message, {
  bool? dismissible,
  OnWidgetClickListener? onCloseListener,
}) async {
  await _show(
    context,
    message,
    dismissible: dismissible,
    backgroundColor: AppColor.green,
    assetSource: AppAssetSource.tick,
    onCloseListener: onCloseListener,
  );
}

Future<void> showErrorSnackbar(
  BuildContext context,
  String message, {
  bool? dismissible,
  OnWidgetClickListener? onCloseListener,
}) async {
  await _show(
    context,
    message,
    dismissible: dismissible,
    backgroundColor: AppColor.red,
    assetSource: AppAssetSource.info,
    onCloseListener: onCloseListener,
  );
}
