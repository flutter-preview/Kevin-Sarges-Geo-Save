abstract interface class LocalDataSourceImpl {
  Future<void> deleteLocal(String id);
  Future<void> updateNome(String id, String novoNome);
}
