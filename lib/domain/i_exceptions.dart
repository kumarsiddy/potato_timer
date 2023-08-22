/// Base interface for the representation of the exception
/// happening in the app. This [message] will be used by
/// the UI to show in a dialog if any error will occur.
abstract class IAppException implements Exception {
  IAppException(this.message);

  final String message;
}
