import 'package:flutter/material.dart';

/// This is used for all the colors used in the app
enum AppColor {
  // Primary Colors
  primary(Color(0xFF216C2E)),
  primaryLight(Color(0xFF006782)),

  // Other Colors
  white(Colors.white),
  offWhite(Color(0xffdae9f1)),
  red(Colors.red),
  green(Colors.green),
  grey(Colors.grey),
  blackTransparent(Colors.black12);

  final Color value;

  const AppColor(this.value);
}
