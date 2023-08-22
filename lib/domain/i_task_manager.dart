import 'package:potato_timer/domain/models/models.dart';

/// This class [ITaskManager] is important for handling the batch operations
/// in the background. Method [runUpdatePeriodically] will be called
/// periodically after defined [periodicTimeInSeconds]. This will save us from
/// the overburden of updating the db when timer will be running.
abstract class ITaskManager {
  /// Time after which periodic method will be called
  int get periodicTimeInSeconds;

  /// To add the [task] into the queue
  void addToQueue(PotatoTimerTask task);

  /// Method which will run periodically
  Future<void> runUpdatePeriodically();

  /// For immediate operations on db
  Future<void> doImmediateOperationOnDB();

  /// disposing this class. Basically associated timer will get
  /// disposed, so that [runUpdatePeriodically] could stop.
  void dispose();
}
