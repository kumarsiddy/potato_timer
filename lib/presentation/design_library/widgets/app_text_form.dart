import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potato_timer/domain/value_validator_interface/i_value_object.dart';
import 'package:potato_timer/utils/utils.dart';

abstract class _BaseTextForm extends StatelessWidget {
  final IValueObject? valueObject;
  final ValueChanged<String>? onChanged;
  final StringKey? labelTextKey;
  final StringKey? hintTextKey;
  final StringKey? errorTextKey;
  final TextInputType? textInputType;
  final TextInputAction? inputAction;
  final int? lengthLimit;
  final int? maxLines;

  const _BaseTextForm(
    this.valueObject, {
    this.onChanged,
    this.labelTextKey,
    this.hintTextKey,
    this.errorTextKey,
    this.textInputType,
    this.inputAction,
    this.lengthLimit,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.top,
      keyboardType: textInputType ?? TextInputType.text,
      textInputAction: inputAction ?? TextInputAction.next,
      initialValue: valueObject?.rawInput,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        labelText: labelTextKey?.value ?? '',
        hintText: hintTextKey?.value ?? '',
        errorText: _getErrorText(),
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(lengthLimit ?? 120),
      ],
    );
  }

  String? _getErrorText() {
    if (valueObject == null ||
        valueObject?.isValid == true ||
        valueObject?.rawInput == null ||
        valueObject?.rawInput?.isEmpty == true) {
      return null;
    }
    return errorTextKey?.value ?? 'Invalid Value';
  }
}

class AppTextForm extends _BaseTextForm {
  const AppTextForm._(
    super.valueObject, {
    super.onChanged,
    super.labelTextKey,
    super.hintTextKey,
    super.errorTextKey,
    super.textInputType,
    super.inputAction,
    super.lengthLimit,
    super.maxLines,
  });

  factory AppTextForm.taskTitle(
    IValueObject? valueObject, {
    required final ValueChanged<String> onChanged,
    final StringKey? labelTextKey,
    final StringKey? hintTextKey,
    final StringKey? errorTextKey,
  }) {
    return AppTextForm._(
      valueObject,
      onChanged: onChanged,
      labelTextKey: labelTextKey,
      hintTextKey: hintTextKey,
      errorTextKey: errorTextKey,
      textInputType: TextInputType.name,
      inputAction: TextInputAction.next,
    );
  }

  factory AppTextForm.taskDescription(
    IValueObject? valueObject, {
    required final ValueChanged<String> onChanged,
    final StringKey? labelTextKey,
    final StringKey? hintTextKey,
    final StringKey? errorTextKey,
  }) {
    return AppTextForm._(
      valueObject,
      onChanged: onChanged,
      labelTextKey: labelTextKey,
      hintTextKey: hintTextKey,
      errorTextKey: errorTextKey,
      textInputType: TextInputType.name,
      inputAction: TextInputAction.done,
      maxLines: 5,
    );
  }

  factory AppTextForm.duration(
    IValueObject? valueObject, {
    required ValueChanged<String> onChanged,
    final StringKey? labelTextKey,
    final StringKey? hintTextKey,
    final StringKey? errorTextKey,
  }) {
    return AppTextForm._(
      valueObject,
      onChanged: onChanged,
      labelTextKey: labelTextKey,
      hintTextKey: hintTextKey,
      errorTextKey: errorTextKey,
      inputAction: TextInputAction.done,
      textInputType: TextInputType.number,
      maxLines: 1,
      lengthLimit: 2,
    );
  }
}
