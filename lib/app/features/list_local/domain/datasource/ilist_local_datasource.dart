import 'package:geosave/app/common/entity/local_entity.dart';

abstract interface class ListLocalDataSourceImpl {
  Future<List<LocalEntity>> getLocais();
}
