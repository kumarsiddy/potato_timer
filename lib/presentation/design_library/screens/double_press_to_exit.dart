import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';
import 'package:potato_timer/utils/utils.dart';

class DoublePressToExit extends StatefulWidget {
  const DoublePressToExit({
    super.key,
    required this.child,
    this.isDashboard = false,
  });

  final Widget child;
  final bool isDashboard;

  @override
  DoublePressToExitState createState() => DoublePressToExitState();
}

class DoublePressToExitState extends State<DoublePressToExit> {
  int? _lastTimeBackButtonWasTapped;
  static const exitTimeInMillis = 2000;

  bool get _isAndroid => Theme.of(context).platform == TargetPlatform.android;

  @override
  Widget build(BuildContext context) {
    if (_isAndroid) {
      return WillPopScope(
        onWillPop: () => _handleWillPop(
          context,
        ),
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }

  Future<bool> _handleWillPop(
    BuildContext context,
  ) async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    if (_lastTimeBackButtonWasTapped != null &&
        (currentTime - _lastTimeBackButtonWasTapped!) < exitTimeInMillis) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      await SystemNavigator.pop();
      return false;
    } else {
      _lastTimeBackButtonWasTapped = DateTime.now().millisecondsSinceEpoch;
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        _getExitSnackBar(context),
      );
      return false;
    }
  }

  SnackBar _getExitSnackBar(
    BuildContext context,
  ) {
    return SnackBar(
      content: AppText.bodyMedium(StringKey.pressBackToExit),
      backgroundColor: AppColor.red.value,
      duration: const Duration(
        seconds: 2,
      ),
      behavior: SnackBarBehavior.floating,
    );
  }
}
