import 'package:potato_timer/domain/value_validator_interface/i_value_failure.dart';

class InputFailure extends IValueFailure<String> {
  InputFailure(super.failedValue);
}

class DurationFailure extends IValueFailure<int?> {
  DurationFailure(super.failedValue);
}
