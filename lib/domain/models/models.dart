import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionStatus {
  ConnectionStatus({
    required this.type,
    required this.working,
  });

  final ConnectivityResult type;

  final bool working;
}

class PotatoTimerTask {
  PotatoTimerTask({
    this.id,
    required this.title,
    required this.description,
    required this.finishAt,
  });

  final int? id;
  final String title;
  final String description;
  final DateTime finishAt;
}
