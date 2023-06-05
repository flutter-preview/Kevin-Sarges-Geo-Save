import 'package:geosave/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:geosave/app/features/local/domain/datasource/ilocal_datasource.dart';
import 'package:geosave/app/features/local/domain/repository/ilocal_repository.dart';

class LocalRepository implements LocalRepositoryImpl {
  final LocalDataSourceImpl dataSource;

  LocalRepository({required this.dataSource});

  @override
  Future<Either<Failure, void>> deleteLocal(String id) async {
    try {
      final result = await dataSource.deleteLocal(id);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
