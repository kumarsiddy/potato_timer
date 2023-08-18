import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:potato_timer/domain/i_connection_aware_facade.dart';
import 'package:potato_timer/domain/i_exceptions.dart';
import 'package:potato_timer/infrastructure/dtos/dtos.dart';
import 'package:potato_timer/infrastructure/exceptions.dart';

part 'base_store.g.dart';

abstract class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {
  final IConnectionAwareFacade _connectionAwareFacade;
  late StreamSubscription _networkChangeSubscription;

  @readonly
  ConnectionStatus? _connectionStatus;
  @readonly
  bool _loading = false;
  @readonly
  IAppException? _appException;

  _BaseStore(
    this._connectionAwareFacade,
  );

  Future<void> init(
    Map<String, dynamic>? args,
  ) async {
    _networkChangeSubscription =
        _connectionAwareFacade.connectionStatusStream.listen(
      (status) => _onConnectivityStatusChanged(
        status: status,
      ),
    );
  }

  void _onConnectivityStatusChanged({
    required ConnectionStatus status,
  }) {
    _connectionStatus = status;
  }

  @action
  void showLoader() {
    _loading = true;
  }

  @action
  void hideLoader() {
    _loading = false;
  }

  Future<void> dispose() async {
    await _networkChangeSubscription.cancel();
  }

  @action
  void handleException(
    IAppException exception,
  ) {
    hideLoader();

    switch (exception.runtimeType) {
      case RecognizedException:
        // updating [_appException] so that it can be
        // observed on UI side, and can be handled accordingly
        _appException = exception;
      default:
      // We can log the crash here to Crashlytics/Sentry
    }
  }
}
