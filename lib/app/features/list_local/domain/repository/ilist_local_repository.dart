import 'package:dartz/dartz.dart';
import 'package:geosave/app/common/entity/local_entity.dart';
import 'package:geosave/app/common/error/failure.dart';

abstract interface class ListLocalRepositoryImpl {
  Future<Either<Failure, List<LocalEntity>>> getLocais();
}
