import 'package:geosave/app/features/list_andar/domain/entity/home_entity.dart';

abstract class ListAndarDataSourceImpl {
  Future<List<ListAndarEntity>> listAndar();
}
