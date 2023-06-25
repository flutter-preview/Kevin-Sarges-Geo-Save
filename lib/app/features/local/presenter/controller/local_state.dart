import 'package:geosave/app/common/error/failure.dart';

abstract base class LocalState {}

final class LocalInitial extends LocalState {}

final class LocalCarregando extends LocalState {}

final class LocalSucesso extends LocalState {}

final class LocalErro extends LocalState {
  Failure erro;

  LocalErro(this.erro);
}
