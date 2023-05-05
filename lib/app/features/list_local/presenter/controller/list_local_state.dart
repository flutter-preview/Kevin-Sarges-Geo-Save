import 'package:geosave/app/common/entity/local_entity.dart';
import 'package:geosave/app/common/error/failure.dart';

abstract class ListLocalState {}

class ListLocalInitial extends ListLocalState {}

class ListLocalCarregando extends ListLocalState {}

class ListLocalSucesso extends ListLocalState {
  List<LocalEntity> locais;

  ListLocalSucesso(this.locais);
}

class ListLocalErro extends ListLocalState {
  Failure erro;

  ListLocalErro(this.erro);
}
