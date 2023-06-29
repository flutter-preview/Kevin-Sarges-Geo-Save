import 'package:dartz/dartz.dart';
import 'package:geosave/app/common/error/failure.dart';
import 'package:geosave/app/features/local/domain/repository/ilocal_repository.dart';

class UpdateNomeUseCase {
  final LocalRepositoryImpl repository;

  UpdateNomeUseCase({required this.repository});

  Future<Either<Failure, void>> call(String id, String novoNome) async {
    return await repository.updateNome(id, novoNome);
  }
}
