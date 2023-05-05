import 'package:geosave/app/common/error/failure.dart';
import 'package:geosave/app/common/entity/local_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:geosave/app/features/list_local/domain/datasource/ilist_local_datasource.dart';
import 'package:geosave/app/features/list_local/domain/repository/ilist_local_repository.dart';

class ListLocalRepository implements ListLocalRepositoryImpl {
  final ListLocalDataSourceImpl dataSource;

  ListLocalRepository({required this.dataSource});

  @override
  Future<Either<Failure, List<LocalEntity>>> getLocais(String andar) async {
    try {
      final result = await dataSource.getLocais(andar);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
