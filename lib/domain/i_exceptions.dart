abstract class IAppException implements Exception {
  IAppException(this.message);

  final String message;
}
