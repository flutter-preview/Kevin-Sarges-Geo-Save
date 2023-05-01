import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geosave/app/common/error/failure.dart';

abstract class MapRepositoryImpl {
  Future<Either<Failure, Position>> getGeoLocalizacaoUsuario();
}
