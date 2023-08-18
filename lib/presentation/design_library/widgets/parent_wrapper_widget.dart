import 'package:flutter/material.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';
import 'package:potato_timer/presentation/design_library/widgets/app_button.dart';
import 'package:potato_timer/utils/string_keys.dart';

class ParentWrapperWidget extends StatelessWidget {
  const ParentWrapperWidget({
    super.key,
    required this.height,
    required this.child,
    this.buttonText,
    this.onPressed,
  });

  final double height;
  final Widget child;
  final StringKey? buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(
          horizontal: 24.r,
          vertical: 16.r,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: child,
              ),
            ),
            if (buttonText != null)
              AppButton.filledButton(
                buttonText!,
                onPressed: onPressed,
              ),
          ],
        ),
      ),
    );
  }
}
