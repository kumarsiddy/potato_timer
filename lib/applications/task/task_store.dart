import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_timer/applications/base/base_store.dart';
import 'package:potato_timer/domain/value_validator_interface/i_value_object.dart';
import 'package:potato_timer/infrastructure/value_validators/value_objects.dart';

part 'task_store.g.dart';

@injectable
class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore extends BaseStore with Store {
  _TaskStore(super.connectionAwareFacade);

  @readonly
  IValueObject<String?>? _taskNameValueObject;

  @action
  void onTaskNameChange(
    String input,
  ) {
    _taskNameValueObject = TaskName(input);
  }
}
