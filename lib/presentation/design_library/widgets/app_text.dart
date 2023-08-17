import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:potato_timer/presentation/design_library/design_library.dart';
import 'package:potato_timer/utils/string_keys.dart';

abstract class _BaseText extends StatelessWidget {
  final StringKey stringKey;
  final double? height;
  final int? maxLines;
  final _TextType type;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? minFontSize;

  const _BaseText(
    this.stringKey, {
    required this.type,
    this.height,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.minFontSize,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return AutoSizeText(
      stringKey.value,
      style: _getStyleBasedOnType(
        context,
        type: type,
      ),
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines ?? 3,
      minFontSize: minFontSize ?? 12.sp,
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

class AppText extends _BaseText {
  const AppText._({
    required StringKey stringKey,
    required _TextType type,
    double? height,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow? overflow,
    double? minFontSize,
  }) : super(
          stringKey,
          type: type,
          height: height,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
          minFontSize: minFontSize,
        );

  factory AppText.displayLarge(
    StringKey stringKey,
  ) {
    return AppText._(
      stringKey: stringKey,
      type: _TextType.displayLarge,
    );
  }

  factory AppText.bodyMedium(
    StringKey stringKey,
  ) {
    return AppText._(
      stringKey: stringKey,
      type: _TextType.bodyMedium,
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
