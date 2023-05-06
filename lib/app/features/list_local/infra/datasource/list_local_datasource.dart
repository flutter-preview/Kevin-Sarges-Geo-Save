import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geosave/app/common/entity/local_entity.dart';
import 'package:geosave/app/common/error/common_errors.dart';
import 'package:geosave/app/common/model/local_model.dart';
import 'package:geosave/app/features/list_local/domain/datasource/ilist_local_datasource.dart';

class ListLocalDataSource implements ListLocalDataSourceImpl {
  final firebase = FirebaseFirestore.instance;

  @override
  Future<List<LocalEntity>> getLocais(String andar) async {
    try {
      final db = await firebase
          .collection('unama')
          .doc(andar)
          .collection('locais')
          .get();

      final result = db.docs.map((doc) {
        final data = doc.data();

        return LocalModel(
          id: doc.id,
          lat: data['lat'] as double,
          lon: data['lon'] as double,
          marker: data['marker'] as String,
          nomeLocal: data['nomeLocal'] as String,
          tipoLocal: data['tipoLocal'] as String,
        );
      }).toList();

      return result;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
