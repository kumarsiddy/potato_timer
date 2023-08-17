import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_timer/applications/base/base_store.dart';

part 'task_store.g.dart';

@injectable
class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore extends BaseStore with Store {
  _TaskStore(super.connectionAwareFacade);
}
