import 'package:geolocator/geolocator.dart';

abstract interface class MapDataSourceImpl {
  Future<Position> getGeoLocalizacaoUsuario();
}
