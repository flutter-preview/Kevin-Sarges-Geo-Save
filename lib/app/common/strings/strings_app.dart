class StringsApp {
  static const String nomeTabela = 'geo_save';
  static const String id = 'id';
  static const String lat = 'lat';
  static const String lon = 'lon';
  static const String nomeLocal = 'nomeLocal';
  static const String nomeDb = 'geosave.db';

  static const String openDb = '''
    CREATE TABLE $nomeTabela (
      $id TEXT PRIMARY KEY,
      $lat REAL,
      $lon REAL,
      $nomeLocal TEXT
    )
 ''';
}
