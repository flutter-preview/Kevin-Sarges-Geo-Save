import 'package:geosave/app/common/error/failure.dart';

abstract class MapState {}

class MapIntial extends MapState {}

class MapCarregando extends MapState {}

class MapSucesso extends MapState {
  double lat;
  double lon;

  MapSucesso(this.lat, this.lon);
}

class MapErro extends MapState {
  Failure erro;

  MapErro(this.erro);
}
