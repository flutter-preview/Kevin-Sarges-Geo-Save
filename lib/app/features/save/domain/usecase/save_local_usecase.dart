import 'package:dartz/dartz.dart';
import 'package:geosave/app/common/error/failure.dart';
import 'package:geosave/app/common/model/local_model.dart';
import 'package:geosave/app/features/save/domain/repository/isave_repository.dart';

class SaveLocalUseCase {
  final SaveRepositoryImpl repository;

  SaveLocalUseCase({required this.repository});

  Future<Either<Failure, void>> call(LocalModel local) async {
    return await repository.saveLocal(local);
  }
}
