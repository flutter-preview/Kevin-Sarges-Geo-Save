import 'package:geosave/app/features/list_andar/domain/datasource/ilist_andar_datasource.dart';
import 'package:geosave/app/features/list_andar/domain/repository/ilist_andar_repository.dart';
import 'package:geosave/app/features/list_andar/domain/usecase/get_list_andar_usecase.dart';
import 'package:geosave/app/features/list_andar/infra/datasource/list_andar_datasource.dart';
import 'package:geosave/app/features/list_andar/infra/repository/list_andar_repository.dart';
import 'package:geosave/app/features/list_andar/presenter/controller/list_andar_cubit.dart';
import 'package:get_it/get_it.dart';

class ListAndarInjectDempendecy {
  static void init(GetIt getIt) {
    getIt.registerFactory<ListAndarDataSourceImpl>(
      () => ListAndarDataSource(),
    );

    getIt.registerFactory<ListAndarRepositoryImpl>(
      () => ListAndarRepository(dataSource: getIt()),
    );

    getIt.registerFactory<GetListAndarUseCase>(
      () => GetListAndarUseCase(repository: getIt()),
    );

    getIt.registerFactory<ListAndarCubit>(
      () => ListAndarCubit(getListAndarUseCase: getIt()),
    );
  }
}
