import 'package:potato_timer/infrastructure/dtos/dtos.dart';

abstract class IConnectionAwareFacade {
  Stream<ConnectionStatus> get connectionStatusStream;

  /// Checks if device has active internet connection or not.
  Future<ConnectionStatus> checkConnection();

  Future<void> updateConnectionStatus();
}
