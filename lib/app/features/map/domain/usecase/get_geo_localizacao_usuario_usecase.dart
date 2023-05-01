import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geosave/app/common/error/failure.dart';
import 'package:geosave/app/features/map/domain/repository/imap_repository.dart';

class GetGeoLocalizacaoUsuarioUseCase {
  final MapRepositoryImpl repository;

  GetGeoLocalizacaoUsuarioUseCase({required this.repository});

  Future<Either<Failure, Position>> call() async {
    return await repository.getGeoLocalizacaoUsuario();
  }
}
