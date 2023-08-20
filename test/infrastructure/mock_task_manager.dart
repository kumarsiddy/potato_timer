import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';
import 'package:potato_timer/domain/i_task_manager.dart';

@Singleton(as: ITaskManager, env: [Environment.test])
class MockTaskManager extends Mock implements ITaskManager {}
