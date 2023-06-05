import 'package:geosave/app/common/error/common_errors.dart';
import 'package:geosave/app/common/helpers/open_database.dart';
import 'package:geosave/app/common/strings/strings_app.dart';
import 'package:geosave/app/features/local/domain/datasource/ilocal_datasource.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataSource implements LocalDataSourceImpl {
  final _openDb = DatabaseHelper();

  @override
  Future<void> deleteLocal(String id) async {
    try {
      final delete = await _openDb.openDb();

      await delete.delete(
        StringsApp.nomeTabela,
        where: 'id = ?',
        whereArgs: [id],
      );
    } on DatabaseException catch (e) {
      throw CommonDesconhecidoError(message: e.toString());
    }
  }
}
