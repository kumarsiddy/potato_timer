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

  @observable
  ObservableList<PotatoTimerTask> tasks = ObservableList<PotatoTimerTask>();

  @override
  Future<void> init(
    Map<String, dynamic>? args,
  ) async {
    await _getAllTasks();
    return super.init(args);
  }

  @action
  Future<void> _getAllTasks() async {
    showLoader();

    final allTasksOrFailure = await _localCacheHandler.getAllSavedTasks();
    allTasksOrFailure.fold(
      handleException,
      (result) {
        // clearing if any data is before there
        // then adding it
        tasks
          ..clear()
          ..addAll(result);
        hideLoader();
      },
    );
  }
}
