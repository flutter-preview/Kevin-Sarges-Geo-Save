class StringsApp {
  static const String nomeTabela = 'teste';
  static const String id = 'id';
  static const String lat = 'lat';
  static const String lon = 'lon';
  static const String nomeLocal = 'nome_local';

  static const String openDb = '''
    CREATE TABLE $nomeTabela (
      $id TEXT PRIMARY KEY,
      $lat REAL,
      $lon REAL,
      $nomeLocal TEXT,
    )
 ''';
}
