import 'package:potato_timer/domain/models/models.dart';

/// This interface [IConnectionAwareFacade] represents state of
/// the connected internet of the device. Stream [connectionStatusStream]
/// will emit the changed status as soon as the connection will change
abstract class IConnectionAwareFacade {
  Stream<ConnectionStatus> get connectionStatusStream;

  /// Checks if device has active internet connection or not.
  Future<ConnectionStatus> checkConnection();

  Future<void> updateConnectionStatus();
}
