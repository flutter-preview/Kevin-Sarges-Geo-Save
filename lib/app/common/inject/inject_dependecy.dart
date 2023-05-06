import 'package:geosave/app/features/list_andar/domain/inject/list_andar_inject.dart';
import 'package:geosave/app/features/list_local/domain/inject/list_local_inject_dependecy.dart';
import 'package:geosave/app/features/local/domain/inject/local_inject.dart';
import 'package:geosave/app/features/map/domain/inject/map_inject.dart';
import 'package:geosave/app/features/save/domain/inject/save_inject.dart';
import 'package:get_it/get_it.dart';

class InjectDependecy {
  static void init() {
    final getIt = GetIt.instance;

    MapInjectDependecy.init(getIt);
    ListAndarInjectDempendecy.init(getIt);
    ListLocalInjectDependecy.init(getIt);
    LocalInjectDependecy.init(getIt);
    SaveInjectDependecy.init(getIt);
  }
}
