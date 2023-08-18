import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_timer/domain/value_validator_interface/i_value_failure.dart';

@immutable
abstract class IValueObject<T> {
  const IValueObject();

  Either<IValueFailure<T>, T> get value;

  String? get rawInput => value.fold(
        (l) => l.failedValue?.toString(),
        (r) => r.toString(),
      );

  bool get isValid => value.isRight();
}
