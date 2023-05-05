import 'package:dartz/dartz.dart';
import 'package:geosave/app/common/error/failure.dart';
import 'package:geosave/app/features/local/domain/repository/ilocal_repository.dart';

class DeleteLocalUseCase {
  final LocalRepositoryImpl repository;

  DeleteLocalUseCase({required this.repository});

  Future<Either<Failure, void>> call(
    String id,
    String andar,
  ) async {
    return await repository.deleteLocal(id, andar);
  }
}
