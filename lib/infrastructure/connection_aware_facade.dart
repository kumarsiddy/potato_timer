import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:potato_timer/domain/i_connection_aware_facade.dart';
import 'package:potato_timer/domain/models/models.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: IConnectionAwareFacade)
class ConnectionAwareFacade implements IConnectionAwareFacade {
  ConnectionAwareFacade() {
    _connectivity.onConnectivityChanged.listen(
      (_) async => updateConnectionStatus(),
    );
  }

  static const int _defaultPort = 53;
  static const Duration _defaultTimeOut = Duration(milliseconds: 3000);

  /// Predefined reliable addresses.
  /// but should be enough. See https://www.dnsperf.com/#!dns-resolvers
  ///
  /// Addresses info:
  /// | Address        | Provider   | Info                                            |
  /// |:---------------|:-----------|:------------------------------------------------|
  /// | 1.1.1.1        | CloudFlare | https://1.1.1.1                                 |
  /// | 8.8.4.4        | Google     | https://developers.google.com/speed/public-dns/ |
  /// | 208.67.222.222 | OpenDNS    | https://use.opendns.com/                        |
  static final List<_AddressCheckOptions> _defaultAddresses =
      List.unmodifiable([
    _AddressCheckOptions(
      InternetAddress('1.1.1.1'),
      port: _defaultPort,
      timeout: _defaultTimeOut,
    ),
    _AddressCheckOptions(
      InternetAddress('8.8.4.4'),
      port: _defaultPort,
      timeout: _defaultTimeOut,
    ),
    _AddressCheckOptions(
      InternetAddress('208.67.222.222'),
      port: _defaultPort,
      timeout: _defaultTimeOut,
    ),
  ]);

  // Stream broadcaster for userStatus
  final connectionStatusSubject = PublishSubject<ConnectionStatus>();

  final Connectivity _connectivity = Connectivity();

  @override
  Stream<ConnectionStatus> get connectionStatusStream =>
      connectionStatusSubject.stream.doOnListen(updateConnectionStatus);

  @override
  Future<void> updateConnectionStatus() async {
    final connectionStatus = await checkConnection();
    connectionStatusSubject.sink.add(connectionStatus);
  }

  @override
  Future<ConnectionStatus> checkConnection() async {
    final requests = <Future<bool>>[];

    for (final addressOption in _defaultAddresses) {
      requests.add(_isHostReachable(addressOption));
    }
    final results = List.unmodifiable(await Future.wait(requests));
    final working = results.contains(true);
    return ConnectionStatus(
      type: await _connectivity.checkConnectivity(),
      working: working,
    );
  }

  Future<bool> _isHostReachable(
    _AddressCheckOptions options,
  ) async {
    Socket? socket;
    try {
      socket = await Socket.connect(
        options.address,
        options.port ?? _defaultPort,
        timeout: options.timeout ?? _defaultTimeOut,
      )
        ..destroy();
      return true;
    } catch (e) {
      socket?.destroy();
      return false;
    }
  }
}

class _AddressCheckOptions {
  _AddressCheckOptions(
    this.address, {
    this.port,
    this.timeout,
  });

  final InternetAddress address;
  final int? port;
  final Duration? timeout;

  @override
  String toString() => '''AddressCheckOptions($address, $port, $timeout)''';
}
