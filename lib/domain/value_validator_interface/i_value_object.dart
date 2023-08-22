import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_timer/domain/value_validator_interface/i_value_failure.dart';

/// The [IValueObject] interface embodies the value of the
/// parent InputFormField. Input provided to InputFormField
/// can be valid or invalid. The [value] in this context encapsulates
/// both states with the structure: `left` and `right`
/// with [value.fold((left) => null, (right) => null)].
/// [isValid] is true when the value is valid.
/// The user's input can be accessed through [rawInput].
@immutable
abstract class IValueObject<T> {
  const IValueObject();

  Either<IValueFailure<T>, T> get value;

  String? get rawInput => value.fold(
        (l) => l.failedValue?.toString(),
        (r) => r.toString(),
      );

  bool get isValid => value.isRight();

  T getOrException() {
    return value.fold(
      (failure) => throw FormatException(failure.failedValue.toString()),
      (r) => r,
    );
  }
}
