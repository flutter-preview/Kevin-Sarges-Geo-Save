import 'package:dartz/dartz.dart';
import 'package:geosave/app/common/error/failure.dart';
import 'package:geosave/app/features/list_andar/domain/entity/home_entity.dart';

abstract class ListAndarRepositoryImpl {
  Future<Either<Failure, List<ListAndarEntity>>> listAndar();
}
