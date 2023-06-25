import 'package:geosave/app/common/model/local_model.dart';

abstract interface class SaveDataSourceImpl {
  Future<void> saveLocal(LocalModel local);
}
