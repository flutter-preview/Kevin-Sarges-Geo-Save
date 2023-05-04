import 'package:geosave/app/common/error/common_errors.dart';
import 'package:geosave/app/features/list_andar/domain/datasource/ilist_andar_datasource.dart';
import 'package:geosave/app/features/list_andar/domain/entity/home_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geosave/app/features/list_andar/domain/model/list_andar_model.dart';

class ListAndarDataSource implements ListAndarDataSourceImpl {
  final firebase = FirebaseFirestore.instance;

  @override
  Future<List<ListAndarEntity>> listAndar() async {
    try {
      final db = await firebase.collection('unama').get();

      final result = db.docs.map((doc) {
        return ListAndarModel(andar: doc.id);
      }).toList();

      return result;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
