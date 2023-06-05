import 'package:dartz/dartz.dart';
import 'package:geosave/app/common/entity/local_entity.dart';
import 'package:geosave/app/common/error/failure.dart';
import 'package:geosave/app/features/list_local/domain/repository/ilist_local_repository.dart';

class GetLocaisUseCase {
  final ListLocalRepositoryImpl repository;

  GetLocaisUseCase({required this.repository});

  Future<Either<Failure, List<LocalEntity>>> call() async {
    return await repository.getLocais();
  }
}
