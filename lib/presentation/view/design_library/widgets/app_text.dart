import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:potato_timer/presentation/view/design_library/app_color.dart';
import 'package:potato_timer/utils/string_keys.dart';

abstract class _BaseText extends StatelessWidget {
  const _BaseText({
    this.stringKey,
    required this.type,
    this.text,
    this.color,
    this.height,
    this.maxLines,
    this.textAlign,
    this.overflow,
  });

  final StringKey? stringKey;
  final String? text;
  final AppColor? color;
  final double? height;
  final int? maxLines;
  final _TextType type;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AutoSizeText(
      stringKey?.value ?? text ?? '',
      style: _getStyleBasedOnType(
        context,
        type: type,
      )?.copyWith(color: color?.value),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 3,
      overflow: overflow,
    );
  }

  TextStyle? _getStyleBasedOnType(
    BuildContext context, {
    required _TextType type,
  }) {
    switch (type) {
      case _TextType.displayLarge:
        return Theme.of(context).textTheme.displayLarge;
      case _TextType.displayMedium:
        return Theme.of(context).textTheme.displayMedium;
      case _TextType.displaySmall:
        return Theme.of(context).textTheme.displaySmall;

      case _TextType.headlineLarge:
        return Theme.of(context).textTheme.headlineLarge;
      case _TextType.headlineMedium:
        return Theme.of(context).textTheme.headlineMedium;
      case _TextType.headlineSmall:
        return Theme.of(context).textTheme.headlineSmall;

      case _TextType.titleLarge:
        return Theme.of(context).textTheme.titleLarge;
      case _TextType.titleMedium:
        return Theme.of(context).textTheme.titleMedium;
      case _TextType.titleSmall:
        return Theme.of(context).textTheme.titleSmall;

      case _TextType.bodyLarge:
        return Theme.of(context).textTheme.bodyLarge;
      case _TextType.bodyMedium:
        return Theme.of(context).textTheme.bodyMedium;
      case _TextType.bodySmall:
        return Theme.of(context).textTheme.bodySmall;

      case _TextType.labelLarge:
        return Theme.of(context).textTheme.labelLarge;
      case _TextType.labelMedium:
        return Theme.of(context).textTheme.labelMedium;
      case _TextType.labelSmall:
        return Theme.of(context).textTheme.labelSmall;
    }
  }
}

// Represents all text which could be used in the app
class AppText extends _BaseText {
  const AppText._({
    required super.type,
    super.stringKey,
    super.text,
    super.color,
    super.height,
    super.maxLines,
    super.textAlign,
    super.overflow,
  });

  factory AppText.displayLarge({
    StringKey? stringKey,
    String? text,
    AppColor? color,
  }) {
    return AppText._(
      stringKey: stringKey,
      text: text,
      type: _TextType.displayLarge,
      color: color,
      maxLines: 1,
    );
  }

  factory AppText.displayMedium({
    StringKey? stringKey,
    String? text,
    AppColor? color,
  }) {
    return AppText._(
      stringKey: stringKey,
      text: text,
      type: _TextType.displayMedium,
      color: color,
      maxLines: 1,
    );
  }

  factory AppText.displaySmall({
    StringKey? stringKey,
    String? text,
    AppColor? color,
  }) {
    return AppText._(
      stringKey: stringKey,
      text: text,
      type: _TextType.displaySmall,
      color: color,
      maxLines: 1,
    );
  }

  factory AppText.headlineLarge({
    StringKey? stringKey,
    String? text,
    AppColor? color,
  }) {
    return AppText._(
      stringKey: stringKey,
      text: text,
      type: _TextType.headlineLarge,
      color: color,
      maxLines: 1,
    );
  }

  factory AppText.headlineMedium({
    StringKey? stringKey,
    String? text,
    AppColor? color,
  }) {
    return AppText._(
      stringKey: stringKey,
      text: text,
      type: _TextType.headlineMedium,
      color: color,
      maxLines: 1,
    );
  }

  factory AppText.headlineSmall({
    StringKey? stringKey,
    String? text,
    AppColor? color,
  }) {
    return AppText._(
      stringKey: stringKey,
      text: text,
      type: _TextType.headlineSmall,
      color: color,
      maxLines: 1,
    );
  }

  factory AppText.titleLarge({
    StringKey? stringKey,
    String? text,
    AppColor? color,
  }) {
    return AppText._(
      stringKey: stringKey,
      text: text,
      type: _TextType.titleLarge,
      color: color,
      maxLines: 1,
    );
  }

  factory AppText.titleMedium({
    StringKey? stringKey,
    String? text,
    AppColor? color,
  }) {
    return AppText._(
      stringKey: stringKey,
      text: text,
      type: _TextType.titleMedium,
      color: color,
      maxLines: 1,
    );
  }

  factory AppText.titleSmall({
    StringKey? stringKey,
    String? text,
    AppColor? color,
  }) {
    return AppText._(
      stringKey: stringKey,
      text: text,
      type: _TextType.titleSmall,
      color: color,
      maxLines: 1,
    );
  }

  factory AppText.bodyMedium({
    StringKey? stringKey,
    String? text,
    AppColor? color,
  }) {
    return AppText._(
      stringKey: stringKey,
      text: text,
      type: _TextType.bodyMedium,
      color: color,
      maxLines: 12,
    );
  }
}

enum _TextType {
  // Display
  displayLarge,
  displayMedium,
  displaySmall,

  // Headlines
  headlineLarge,
  headlineMedium,
  headlineSmall,

  // Title
  titleLarge,
  titleMedium,
  titleSmall,

  // Body
  bodyLarge,
  bodyMedium,
  bodySmall,

  // Label
  labelLarge,
  labelMedium,
  labelSmall,
}
