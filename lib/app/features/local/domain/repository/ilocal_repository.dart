import 'package:dartz/dartz.dart';
import 'package:geosave/app/common/error/failure.dart';

abstract class LocalRepositoryImpl {
  Future<Either<Failure, void>> deleteLocal(
    String id,
  );
}
