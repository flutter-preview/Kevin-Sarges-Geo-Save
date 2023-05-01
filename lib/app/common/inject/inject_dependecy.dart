import 'package:geosave/app/features/map/domain/inject/map_inject.dart';
import 'package:get_it/get_it.dart';

class InjectDependecy {
  static void init() {
    final getIt = GetIt.instance;

    MapInjectDependecy.init(getIt);
  }
}
