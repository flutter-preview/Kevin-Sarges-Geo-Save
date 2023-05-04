import 'package:geosave/app/common/error/failure.dart';
import 'package:geosave/app/features/list_andar/domain/entity/home_entity.dart';

abstract class ListAndarState {}

class ListAndarInital extends ListAndarState {}

class ListAndarCarregando extends ListAndarState {}

class ListAndarSucesso extends ListAndarState {
  List<ListAndarEntity> andares;

  ListAndarSucesso(this.andares);
}

class ListAndarErro extends ListAndarState {
  Failure erro;

  ListAndarErro(this.erro);
}
