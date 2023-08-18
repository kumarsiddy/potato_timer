import 'package:dartz/dartz.dart';
import 'package:potato_timer/domain/value_validator_interface/i_value_failure.dart';
import 'package:potato_timer/domain/value_validator_interface/i_value_object.dart';
import 'package:potato_timer/infrastructure/value_validators/validator_logics.dart';

class TaskNameValueObject extends IValueObject<String> {
  @override
  final Either<IValueFailure<String>, String> value;

  factory TaskNameValueObject(String input) {
    return TaskNameValueObject._(validateTaskName(input));
  }

  const TaskNameValueObject._(this.value);
}

class TaskDescriptionValueObject extends IValueObject<String> {
  @override
  final Either<IValueFailure<String>, String> value;

  factory TaskDescriptionValueObject(String input) {
    return TaskDescriptionValueObject._(validateTaskDescription(input));
  }

  const TaskDescriptionValueObject._(this.value);
}

class HourValueObject extends IValueObject<int?> {
  @override
  final Either<IValueFailure<int?>, int> value;

  factory HourValueObject(String input) {
    return HourValueObject._(validateHour(input));
  }

  const HourValueObject._(this.value);
}

class MinuteValueObject extends IValueObject<int?> {
  @override
  final Either<IValueFailure<int?>, int> value;

  factory MinuteValueObject(String input) {
    return MinuteValueObject._(validateMinuteOrSecond(input));
  }

  const MinuteValueObject._(this.value);
}

class SecondValueObject extends IValueObject<int?> {
  @override
  final Either<IValueFailure<int?>, int> value;

  factory SecondValueObject(String input) {
    return SecondValueObject._(validateMinuteOrSecond(input));
  }

  const SecondValueObject._(this.value);
}
