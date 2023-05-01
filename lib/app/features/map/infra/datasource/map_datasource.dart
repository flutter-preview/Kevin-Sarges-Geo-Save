import 'dart:html';

import 'package:geolocator/geolocator.dart';
import 'package:geosave/app/common/error/common_errors.dart';
import 'package:geosave/app/features/map/domain/datasource/imap_datasourcer.dart';

class MapDataSource implements MapDataSourceImpl {
  @override
  Future<Position> getGeoLocalizacaoUsuario() async {
    try {
      final permission = await Geolocator.checkPermission();
      final request = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied &&
          request == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso á localização !!');
      }

      if (permission == LocationPermission.deniedForever) {
        Future.error('Você precisa autorizar o acesso á localização !!');
      }

      final local = await Geolocator.getCurrentPosition();

      return local;
    } on PositionError catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
