import 'package:geosave/app/features/local/domain/datasource/ilocal_datasource.dart';
import 'package:geosave/app/features/local/domain/repository/ilocal_repository.dart';
import 'package:geosave/app/features/local/domain/usecase/delete_local_usecase.dart';
import 'package:geosave/app/features/local/domain/usecase/update_nome_usecase.dart';
import 'package:geosave/app/features/local/infra/datasource/local_datasource.dart';
import 'package:geosave/app/features/local/infra/repository/local_repository.dart';
import 'package:geosave/app/features/local/presenter/controller/local_cubit.dart';
import 'package:get_it/get_it.dart';

class LocalInjectDependecy {
  static void init(GetIt getIt) {
    getIt.registerFactory<LocalDataSourceImpl>(
      () => LocalDataSource(),
    );

    getIt.registerFactory<LocalRepositoryImpl>(
      () => LocalRepository(dataSource: getIt()),
    );

    getIt.registerFactory<DeleteLocalUseCase>(
      () => DeleteLocalUseCase(repository: getIt()),
    );

    getIt.registerFactory<UpdateNomeUseCase>(
      () => UpdateNomeUseCase(repository: getIt()),
    );

    getIt.registerFactory(
      () => LocalCubit(
        deleteLocalUseCase: getIt(),
        updateNomeUseCase: getIt(),
      ),
    );
  }
}
