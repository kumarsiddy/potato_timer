import 'package:potato_timer/domain/i_exceptions.dart';

/// This exception will be used to show some message
/// to the app. This basically represents the handled state
/// of the exception.
class RecognizedException extends IAppException {
  RecognizedException(super.message);
}
