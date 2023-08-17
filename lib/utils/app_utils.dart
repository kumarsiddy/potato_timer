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
