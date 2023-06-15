import 'package:dartz/dartz.dart';
import 'package:geosave/app/common/error/failure.dart';
import 'package:geosave/app/common/model/local_model.dart';

abstract interface class SaveRepositoryImpl {
  Future<Either<Failure, void>> saveLocal(LocalModel local);
}
