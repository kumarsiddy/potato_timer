import 'package:potato_timer/domain/models/potato_timer_task.dart';
import 'package:potato_timer/infrastructure/database/app_database.dart';

PotatoTimerTask getTaskFromInfraDto(
  Task task,
) {
  return PotatoTimerTask(
    title: task.title,
    description: task.description,
    finishAt: task.finishAt,
  );
}
