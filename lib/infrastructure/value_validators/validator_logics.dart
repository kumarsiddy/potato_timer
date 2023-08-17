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

Either<IValueFailure<String>, String> validateDuration(
  String input,
) {
  if (input.length > 10) {
    return right(input);
  }
  return left(InputFailure(input));
}
