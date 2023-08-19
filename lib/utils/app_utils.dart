import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

Map<String, dynamic>? getArgsFromContext(
  BuildContext context,
) {
  return ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
}

bool isCurrentScreen(BuildContext context) =>
    ModalRoute.of(context)?.isCurrent ?? false;

bool isActiveScreen(BuildContext context) =>
    ModalRoute.of(context)?.isActive ?? false;

bool isBuildContextSafeToUse(BuildContext context) {
  return context.mounted;
}

T storeOf<T>(
  BuildContext context,
) {
  return Provider.of<T>(context, listen: false);
}

(String, String, String) getFormattedTimeFrom({
  required int elapsedTimeInSecond,
}) {
  String twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  final duration = Duration(seconds: elapsedTimeInSecond);
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return (hours, minutes, seconds);
}
