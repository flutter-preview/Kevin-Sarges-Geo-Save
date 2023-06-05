import 'package:geosave/app/common/strings/strings_app.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Future<Database> openDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'geosave.db');

    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(StringsApp.openDb);
  }
}
