import 'package:flutter/material.dart';

enum AppColor {
  // Primary Colors
  primary(Color(0xFF216C2E)),
  primaryLight(Color(0xFFE5EEF8)),

  // Other Colors
  white(Colors.white),
  red(Colors.red),
  green(Colors.green),
  grey(Colors.grey),
  blackTransparent(Colors.black12);

  final Color value;

  const AppColor(this.value);
}
