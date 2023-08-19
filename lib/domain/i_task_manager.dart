import 'package:potato_timer/domain/models/models.dart';

abstract class ITaskManager {
  void addToQueue(PotatoTimerTask task);

  Future<void> runUpdatePeriodically();

  void dispose();
}
