import 'package:geosave/app/common/helpers/open_database.dart';
import 'package:geosave/app/common/strings/strings_app.dart';
import 'package:sqflite/sqflite.dart';

import 'package:geosave/app/common/error/common_errors.dart';
import 'package:geosave/app/common/model/local_model.dart';
import 'package:geosave/app/features/save/domain/datasource/isave_datasource.dart';

class SaveDataSource implements SaveDataSourceImpl {
  final _openDb = DatabaseHelper();

  @override
  Future<void> saveLocal(LocalModel local, String andar) async {
    try {
      final database = await _openDb.openDb();

      await database.transaction((txn) async {
        await txn.rawInsert('''
          INSERT INTO ${StringsApp.nomeTabela}(id, lat, lon, marker, nomeLocal, tipoLocal)
          VALUES(?, ?, ?, ?, ?, ?)
        ''', [
          local.id,
          local.lat,
          local.lon,
          local.nomeLocal,
        ]);
      });
    } on DatabaseException catch (e) {
      throw CommonDesconhecidoError(message: e.toString());
    }
  }
}
