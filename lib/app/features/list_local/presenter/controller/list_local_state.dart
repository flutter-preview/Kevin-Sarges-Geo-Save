import 'package:geosave/app/common/entity/local_entity.dart';
import 'package:geosave/app/common/error/failure.dart';

abstract base class ListLocalState {}

final class ListLocalInitial extends ListLocalState {}

final class ListLocalCarregando extends ListLocalState {}

final class ListLocalSucesso extends ListLocalState {
  List<LocalEntity> locais;

  ListLocalSucesso(this.locais);
}

final class ListLocalErro extends ListLocalState {
  Failure erro;

  ListLocalErro(this.erro);
}
