import 'package:injectable/injectable.dart';
import 'package:potato_timer/applications/base/base_store.dart';

@injectable
class SplashStore extends BaseStore {
  SplashStore(
    super.connectionAwareFacade,
  );
}
