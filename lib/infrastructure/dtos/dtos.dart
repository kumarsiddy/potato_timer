import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dtos.freezed.dart';

@freezed
class ConnectionStatus with _$ConnectionStatus {
  const factory ConnectionStatus({
    required final ConnectivityResult type,
    required final bool working,
  }) = _ConnectionStatus;
}
