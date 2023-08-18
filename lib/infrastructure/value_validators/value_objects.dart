import 'package:dartz/dartz.dart';
import 'package:potato_timer/domain/value_validator_interface/i_value_failure.dart';
import 'package:potato_timer/domain/value_validator_interface/i_value_object.dart';
import 'package:potato_timer/infrastructure/value_validators/validator_logics.dart';

class TaskNameValueObject extends IValueObject<String> {
  factory TaskNameValueObject(String input) {
    return TaskNameValueObject._(validateTaskName(input));
  }

  const TaskNameValueObject._(this.value);

  @override
  final Either<IValueFailure<String>, String> value;
}

class TaskDescriptionValueObject extends IValueObject<String> {
  factory TaskDescriptionValueObject(String input) {
    return TaskDescriptionValueObject._(validateTaskDescription(input));
  }

  const TaskDescriptionValueObject._(this.value);

  @override
  final Either<IValueFailure<String>, String> value;
}

class HourValueObject extends IValueObject<int?> {
  factory HourValueObject(String input) {
    return HourValueObject._(validateHour(input));
  }

  const HourValueObject._(this.value);

  @override
  final Either<IValueFailure<int?>, int> value;
}

class MinuteValueObject extends IValueObject<int?> {
  factory MinuteValueObject(String input) {
    return MinuteValueObject._(validateMinuteOrSecond(input));
  }

  const MinuteValueObject._(this.value);

  @override
  final Either<IValueFailure<int?>, int> value;
}

class SecondValueObject extends IValueObject<int?> {
  factory SecondValueObject(String input) {
    return SecondValueObject._(validateMinuteOrSecond(input));
  }

  const SecondValueObject._(this.value);

  @override
  final Either<IValueFailure<int?>, int> value;
}
