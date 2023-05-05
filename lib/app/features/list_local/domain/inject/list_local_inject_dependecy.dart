import 'package:geosave/app/features/list_local/domain/datasource/ilist_local_datasource.dart';
import 'package:geosave/app/features/list_local/domain/repository/ilist_local_repository.dart';
import 'package:geosave/app/features/list_local/domain/usecase/get_locais_usecase.dart';
import 'package:geosave/app/features/list_local/infra/datasource/list_local_datasource.dart';
import 'package:geosave/app/features/list_local/infra/repository/list_local_repository.dart';
import 'package:geosave/app/features/list_local/presenter/controller/list_local_cubit.dart';
import 'package:get_it/get_it.dart';

class ListLocalInjectDependecy {
  static void init(GetIt getIt) {
    getIt.registerFactory<ListLocalDataSourceImpl>(() => ListLocalDataSource());

    getIt.registerFactory<ListLocalRepositoryImpl>(
      () => ListLocalRepository(dataSource: getIt()),
    );

    getIt.registerFactory<GetLocaisUseCase>(
      () => GetLocaisUseCase(repository: getIt()),
    );

    getIt.registerFactory<ListLocalCubit>(
      () => ListLocalCubit(getLocaisUseCase: getIt()),
    );
  }
}
