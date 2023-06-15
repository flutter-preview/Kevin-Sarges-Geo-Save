import 'package:geosave/app/common/error/failure.dart';

abstract base class MapState {}

final class MapIntial extends MapState {}

final class MapCarregando extends MapState {}

final class MapSucesso extends MapState {
  double lat;
  double lon;

  MapSucesso(this.lat, this.lon);
}

final class MapErro extends MapState {
  Failure erro;

  MapErro(this.erro);
}
