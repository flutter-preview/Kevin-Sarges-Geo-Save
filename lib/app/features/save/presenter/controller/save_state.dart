import 'package:geosave/app/common/error/failure.dart';

abstract base class SaveState {}

final class SaveInitial extends SaveState {}

final class SaveCarregando extends SaveState {}

final class SaveSucesso extends SaveState {}

final class SaveErro extends SaveState {
  Failure erro;

  SaveErro(this.erro);
}
