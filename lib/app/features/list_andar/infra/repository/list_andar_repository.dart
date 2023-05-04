import 'package:geosave/app/features/list_andar/domain/datasource/ilist_andar_datasource.dart';
import 'package:geosave/app/features/list_andar/domain/entity/home_entity.dart';
import 'package:geosave/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:geosave/app/features/list_andar/domain/repository/ilist_andar_repository.dart';

class ListAndarRepository implements ListAndarRepositoryImpl {
  final ListAndarDataSourceImpl dataSource;

  ListAndarRepository({required this.dataSource});

  @override
  Future<Either<Failure, List<ListAndarEntity>>> listAndar() async {
    try {
      final result = await dataSource.listAndar();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
