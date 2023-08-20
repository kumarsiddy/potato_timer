import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';
import 'package:potato_timer/domain/i_local_cache_handler.dart';

@Singleton(as: ILocalCacheHandler, env: [Environment.test])
class MockLocalCacheHandler extends Mock implements ILocalCacheHandler {}
