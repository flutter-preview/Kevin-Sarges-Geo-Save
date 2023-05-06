import 'package:geosave/app/features/save/domain/datasource/isave_datasource.dart';
import 'package:geosave/app/features/save/domain/repository/isave_repository.dart';
import 'package:geosave/app/features/save/domain/usecase/save_local_usecase.dart';
import 'package:geosave/app/features/save/infra/datasource/save_datasource.dart';
import 'package:geosave/app/features/save/infra/repository/save_repository.dart';
import 'package:geosave/app/features/save/presenter/controller/save_cubit.dart';
import 'package:get_it/get_it.dart';

class SaveInjectDependecy {
  static void init(GetIt getIt) {
    getIt.registerFactory<SaveDataSourceImpl>(
      () => SaveDataSource(),
    );

    getIt.registerFactory<SaveRepositoryImpl>(
      () => SaveRepository(dataSource: getIt()),
    );

    getIt.registerFactory<SaveLocalUseCase>(
      () => SaveLocalUseCase(repository: getIt()),
    );

    getIt.registerFactory<SaveCubit>(
      () => SaveCubit(saveLocalUseCase: getIt()),
    );
  }
}
