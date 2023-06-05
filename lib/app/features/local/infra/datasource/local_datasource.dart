import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geosave/app/common/error/common_errors.dart';
import 'package:geosave/app/features/local/domain/datasource/ilocal_datasource.dart';

class LocalDataSource implements LocalDataSourceImpl {
  final firebase = FirebaseFirestore.instance;

  @override
  Future<void> deleteLocal(
    String id,
  ) async {
    try {
      final db = await firebase.collection('unama').doc(id).delete();

      return db;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
