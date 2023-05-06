import 'package:geosave/app/common/entity/local_entity.dart';

class LocalModel extends LocalEntity {
  LocalModel({
    required super.id,
    required super.lat,
    required super.lon,
    required super.marker,
    required super.nomeLocal,
    required super.tipoLocal,
  });

  factory LocalModel.fromJson(Map<String, dynamic> json) {
    return LocalModel(
      id: json['id'],
      lat: json['lat'],
      lon: json['lon'],
      marker: json['marker'],
      nomeLocal: json['nomeLocal'],
      tipoLocal: json['tipoLocal'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'id': id,
      'lat': lat,
      'lon': lon,
      'marker': marker,
      'nomeLocal': nomeLocal,
      'tipoLocal': tipoLocal,
    };

    return data;
  }

  static List<LocalEntity> fromJsonToList(List list) {
    return list.map((item) => LocalModel.fromJson(item)).toList();
  }
}
