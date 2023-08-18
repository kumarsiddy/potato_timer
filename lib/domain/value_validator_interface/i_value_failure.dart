abstract class IValueFailure<T> {
  IValueFailure(this.failedValue);

  final T failedValue;
}
