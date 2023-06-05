import 'package:geosave/app/common/entity/local_entity.dart';

class LocalModel extends LocalEntity {
  LocalModel({
    required super.id,
    required super.lat,
    required super.lon,
    required super.nomeLocal,
  });

  factory LocalModel.fromJson(Map<String, dynamic> json) {
    return LocalModel(
      id: json['id'],
      lat: json['lat'],
      lon: json['lon'],
      nomeLocal: json['nomeLocal'],
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> data) {
    data = {
      'id': id,
      'lat': lat,
      'lon': lon,
      'nomeLocal': nomeLocal,
    };

    return data;
  }

  static List<LocalEntity> fromJsonToList(List list) {
    return list.map((item) => LocalModel.fromJson(item)).toList();
  }
}
