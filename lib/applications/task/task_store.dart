import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_timer/applications/base/base_store.dart';
import 'package:potato_timer/domain/i_task_handler_facade.dart';
import 'package:potato_timer/domain/models/models.dart';
import 'package:potato_timer/domain/value_validator_interface/i_value_object.dart';
import 'package:potato_timer/infrastructure/value_validators/value_objects.dart';

part 'task_store.g.dart';

@injectable
class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore extends BaseStore with Store {
  _TaskStore(
    super.connectionAwareFacade,
    this._taskHandlerFacade,
  );

  final ITaskHandlerFacade _taskHandlerFacade;

  @readonly
  IValueObject<String>? _taskTitleValueObject;

  @readonly
  IValueObject<String>? _taskDescriptionValueObject;

  @readonly
  IValueObject<int?>? _hourValueObject;

  @readonly
  IValueObject<int?>? _minuteValueObject;

  @readonly
  IValueObject<int?>? _secondValueObject;

  @computed
  Duration get _duration => _getDuration();

  @computed
  bool get validDuration => _isValidDuration();

  @readonly
  bool _taskSaved = false;

  @action
  void onTaskNameChange(
    String input,
  ) {
    _taskTitleValueObject = TaskNameValueObject(input);
  }

  @action
  void onTaskDescriptionChange(
    String input,
  ) {
    _taskDescriptionValueObject = TaskDescriptionValueObject(input);
  }

  @action
  void onHourChange(
    String input,
  ) {
    _hourValueObject = HourValueObject(input);
  }

  @action
  void onMinuteChange(
    String input,
  ) {
    _minuteValueObject = MinuteValueObject(input);
  }

  @action
  void onSecondChange(
    String input,
  ) {
    _secondValueObject = SecondValueObject(input);
  }

  @action
  Future<void> onAddTaskButtonClick() async {
    showLoader();

    final finishAt = DateTime.now().add(_duration);
    final saveTaskOrFailure = await _taskHandlerFacade.addTask(
      task: PotatoTimerTask(
        title: _taskTitleValueObject!.getOrCrash(),
        description: _taskDescriptionValueObject!.getOrCrash(),
        finishAt: finishAt,
      ),
    );

    saveTaskOrFailure.fold(
      handleException,
      (result) {
        hideLoader();
        _taskSaved = true;
      },
    );
  }

  Duration _getDuration() {
    final hour = _hourValueObject?.value.fold<int?>((l) => null, (r) => r);
    final minute = _minuteValueObject?.value.fold<int?>((l) => null, (r) => r);
    final second = _secondValueObject?.value.fold<int?>((l) => null, (r) => r);

    return Duration(
      hours: hour ?? 0,
      minutes: minute ?? 0,
      seconds: second ?? 0,
    );
  }

  bool _isValidDuration() {
    return _taskTitleValueObject?.isValid == true &&
        _taskDescriptionValueObject?.isValid == true &&
        _duration.inMilliseconds > 0;
  }
}
