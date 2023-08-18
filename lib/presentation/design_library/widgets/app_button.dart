import 'package:flutter/material.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';
import 'package:potato_timer/utils/string_keys.dart';

/// Currently this [_BaseButton] class has only one [FilledButton] defined.
/// It should have implementation of All buttons required for the app.
/// As for this assignment only one button type is required
abstract class _BaseButton extends StatelessWidget {
  const _BaseButton({
    super.key,
    required this.stringKey,
    required this.onPressed,
  });

  final StringKey stringKey;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: AppText.bodyMedium(
        stringKey,
        color: AppColor.white,
      ),
    );
  }
}

class AppButton extends _BaseButton {
  const AppButton._({
    super.key,
    required super.stringKey,
    required super.onPressed,
  });

  factory AppButton.filledButton(
    StringKey stringKey, {
    required VoidCallback? onPressed,
  }) {
    return AppButton._(
      stringKey: stringKey,
      onPressed: onPressed,
    );
  }
}
