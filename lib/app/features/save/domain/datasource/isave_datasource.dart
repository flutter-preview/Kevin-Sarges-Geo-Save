import 'package:geosave/app/common/model/local_model.dart';

abstract class SaveDataSourceImpl {
  Future<void> saveLocal(LocalModel local);
}
