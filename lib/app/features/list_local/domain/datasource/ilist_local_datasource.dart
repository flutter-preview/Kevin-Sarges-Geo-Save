import 'package:geosave/app/common/entity/local_entity.dart';

abstract class ListLocalDataSourceImpl {
  Future<List<LocalEntity>> getLocais();
}
