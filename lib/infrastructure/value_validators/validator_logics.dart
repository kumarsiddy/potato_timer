import 'package:dartz/dartz.dart';
import 'package:potato_timer/domain/value_validator_interface/i_value_failure.dart';
import 'package:potato_timer/infrastructure/value_validators/value_failures.dart';

Either<IValueFailure<String>, String> validateTaskName(
  String input,
) {
  if (input.length > 5) {
    return right(input);
  }
  return left(InputFailure(input));
}

Either<IValueFailure<String>, String> validateTaskDescription(
  String input,
) {
  if (input.length > 10) {
    return right(input);
  }
  return left(InputFailure(input));
}

Either<IValueFailure<int?>, int> validateHour(
  String input,
) {
  final hour = int.tryParse(input);

  if (hour == null || hour > 24 || hour < 0) {
    return left(DurationFailure(hour));
  }

  return right(hour);
}

Either<IValueFailure<int?>, int> validateMinuteOrSecond(
  String input,
) {
  final minute = int.tryParse(input);

  if (minute == null || minute > 60 || minute < 0) {
    return left(DurationFailure(minute));
  }

  return right(minute);
}
