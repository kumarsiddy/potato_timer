import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:potato_timer/domain/i_connection_aware_facade.dart';
import 'package:potato_timer/domain/i_exceptions.dart';
import 'package:potato_timer/domain/models/models.dart';

part 'base_store.g.dart';

abstract class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {
  _BaseStore(
    this._connectionAwareFacade,
  );

  final IConnectionAwareFacade _connectionAwareFacade;
  late StreamSubscription _networkChangeSubscription;

  @readonly
  ConnectionStatus? _connectionStatus;
  @readonly
  bool _loading = false;
  @readonly
  IAppException? _appException;

  Future<void> init(
    Map<String, dynamic>? args,
  ) async {
    _networkChangeSubscription =
        _connectionAwareFacade.connectionStatusStream.listen(
      (status) => _connectionStatus = status,
    );
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

    // updating [_appException] so that it can be
    // observed on UI side, and can be handled accordingly
    _appException = exception;
  }
}
