class LocalEntity {
  String? id;
  String nomeLocal;
  String tipoLocal;
  String marker;
  double lat;
  double lon;

  LocalEntity(
    this.id, {
    required this.lat,
    required this.lon,
    required this.marker,
    required this.nomeLocal,
    required this.tipoLocal,
  });
}
