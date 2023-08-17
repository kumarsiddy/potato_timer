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

  const _BaseTextForm(
    this.valueObject, {
    this.onChanged,
    this.labelTextKey,
    this.hintTextKey,
    this.errorTextKey,
    this.textInputType,
    this.inputAction,
    this.lengthLimit,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.top,
      keyboardType: textInputType ?? TextInputType.text,
      textInputAction: inputAction ?? TextInputAction.next,
      initialValue: valueObject?.input,
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
        valueObject?.input.isEmpty == true) {
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
  });

  factory AppTextForm.taskName(
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
    );
  }
}
