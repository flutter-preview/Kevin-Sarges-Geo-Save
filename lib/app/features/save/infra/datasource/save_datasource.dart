import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geosave/app/common/error/common_errors.dart';
import 'package:geosave/app/common/model/local_model.dart';
import 'package:geosave/app/features/save/domain/datasource/isave_datasource.dart';

class SaveDataSource implements SaveDataSourceImpl {
  final firebase = FirebaseFirestore.instance;

  @override
  Future<void> saveLocal(LocalModel local, String andar) async {
    try {
      await firebase.collection('unama').doc(andar).collection('locais').add({
        'id': local.id,
        'lat': local.lat,
        'lon': local.lon,
        'marker': local.marker,
        'nomeLocal': local.nomeLocal,
        'tipoLocal': local.tipoLocal,
      });
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
