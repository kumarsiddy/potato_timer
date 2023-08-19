import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionStatus {
  ConnectionStatus({
    required this.type,
    required this.working,
  });

  final ConnectivityResult type;

  final bool working;
}

// Not using freezed for sake of simplicity
// Another reason is I don't like to pollute domain layer
// with freezed annotation, freezed is mostly meant to be for infra layer
class PotatoTimerTask {
  PotatoTimerTask({
    this.id,
    required this.title,
    required this.description,
    required this.elapsedSeconds,
    this.paused = false,
    this.finished = false,
  });

  final int? id;
  final String title;
  final String description;
  final int elapsedSeconds;
  final bool paused;
  final bool finished;

  PotatoTimerTask copyWith({
    final int? id,
    final String? title,
    final String? description,
    final int? elapsedSeconds,
    final bool? paused,
    final bool? finished,
  }) {
    return PotatoTimerTask(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      paused: paused ?? this.paused,
      finished: finished ?? this.finished,
    );
  }
}
