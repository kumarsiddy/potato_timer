import 'package:dartz/dartz.dart';
import 'package:potato_timer/domain/value_validator_interface/i_value_failure.dart';
import 'package:potato_timer/domain/value_validator_interface/i_value_object.dart';
import 'package:potato_timer/infrastructure/value_validators/validator_logics.dart';

class TaskName extends IValueObject<String> {
  @override
  final Either<IValueFailure<String>, String> value;

  factory TaskName(String input) {
    return TaskName._(validateTaskName(input));
  }

  const TaskName._(this.value);
}
