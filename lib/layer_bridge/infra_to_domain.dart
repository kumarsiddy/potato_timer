import 'package:potato_timer/domain/models/models.dart';
import 'package:potato_timer/infrastructure/database/app_database.dart';

PotatoTimerTask getTaskFromInfraDto(
  Task task,
) {
  return PotatoTimerTask(
    id: task.id,
    title: task.title,
    description: task.description,
    elapsedSeconds: task.elapsedSeconds,
  );
}
