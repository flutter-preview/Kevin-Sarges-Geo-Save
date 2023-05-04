import 'package:dartz/dartz.dart';
import 'package:geosave/app/common/error/failure.dart';
import 'package:geosave/app/features/list_andar/domain/entity/home_entity.dart';
import 'package:geosave/app/features/list_andar/domain/repository/ilist_andar_repository.dart';

class GetListAndarUseCase {
  final ListAndarRepositoryImpl repository;

  GetListAndarUseCase({required this.repository});

  Future<Either<Failure, List<ListAndarEntity>>> call() async {
    return await repository.listAndar();
  }
}
