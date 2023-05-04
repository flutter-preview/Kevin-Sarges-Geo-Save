import 'package:geosave/app/features/list_andar/domain/entity/home_entity.dart';

class ListAndarModel extends ListAndarEntity {
  ListAndarModel({required super.andar});

  factory ListAndarModel.fromJson(Map<String, dynamic> json) {
    return ListAndarModel(andar: json['andar'] as String);
  }

  static List<ListAndarEntity> fromJsonToList(List list) {
    return list.map((json) => ListAndarModel.fromJson(json)).toList();
  }
}
