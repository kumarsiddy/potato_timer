import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_timer/applications/base/base_store.dart';
import 'package:potato_timer/domain/i_local_cache_handler.dart';
import 'package:potato_timer/domain/models/models.dart';

part 'home_page_store.g.dart';

@injectable
class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore extends BaseStore with Store {
  _HomePageStore(
    super.connectionAwareFacade,
    this._localCacheHandler,
  );

  final ILocalCacheHandler _localCacheHandler;

  final ObservableList<PotatoTimerTask> tasks =
      ObservableList<PotatoTimerTask>();
}
