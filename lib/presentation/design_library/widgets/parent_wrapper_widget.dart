import 'package:flutter/material.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';

class ParentWrapperWidget extends StatelessWidget {
  final double height;
  final Widget child;

  const ParentWrapperWidget({
    super.key,
    required this.height,
    required this.child,
  });

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
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
