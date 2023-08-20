import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_timer/applications/base/base_store.dart';

part 'splash_store.g.dart';

@injectable
class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore extends BaseStore with Store {
  _SplashStore(
    super.connectionAwareFacade,
  );

  @readonly
  bool _loaded = false;

  @override
  Future<void> init([
    Map<String, dynamic>? args,
  ]) async {
    _loadData();
    return super.init(args);
  }

  @action
  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    _loaded = true;
  }
}
