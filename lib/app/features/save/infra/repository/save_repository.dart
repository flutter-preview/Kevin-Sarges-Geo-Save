import 'package:geosave/app/common/model/local_model.dart';
import 'package:geosave/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:geosave/app/features/save/domain/datasource/isave_datasource.dart';
import 'package:geosave/app/features/save/domain/repository/isave_repository.dart';

class SaveRepository implements SaveRepositoryImpl {
  final SaveDataSourceImpl dataSource;

  SaveRepository({required this.dataSource});

  @override
  Future<Either<Failure, void>> saveLocal(
    LocalModel local,
    String andar,
  ) async {
    try {
      final result = await dataSource.saveLocal(local, andar);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
