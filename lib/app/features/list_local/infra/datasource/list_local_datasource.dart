import 'package:geosave/app/common/helpers/open_database.dart';
import 'package:geosave/app/common/strings/strings_app.dart';
import 'package:sqflite/sqflite.dart';

import 'package:geosave/app/common/entity/local_entity.dart';
import 'package:geosave/app/common/error/common_errors.dart';
import 'package:geosave/app/common/model/local_model.dart';
import 'package:geosave/app/features/list_local/domain/datasource/ilist_local_datasource.dart';

class ListLocalDataSource implements ListLocalDataSourceImpl {
  final _openDb = DatabaseHelper();

  @override
  Future<List<LocalEntity>> getLocais() async {
    try {
      final database = await _openDb.openDb();
      final result = await database.query(StringsApp.nomeTabela);

      return result.map((row) {
        return LocalModel(
          id: row['id'] as String,
          lat: row['lat'] as double,
          lon: row['lon'] as double,
          nomeLocal: row['nomeLocal'] as String,
        );
      }).toList();
    } on DatabaseException catch (e) {
      throw CommonDesconhecidoError(message: e.toString());
    }
  }
}
