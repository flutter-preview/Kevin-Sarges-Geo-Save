import 'package:geosave/app/common/error/failure.dart';

abstract class LocalState {}

class LocalInitial extends LocalState {}

class LocalCarregando extends LocalState {}

class LocalSucesso extends LocalState {}

class LocalErro extends LocalState {
  Failure erro;

  LocalErro(this.erro);
}
