import 'package:geosave/app/common/error/failure.dart';

abstract class SaveState {}

class SaveInitial extends SaveState {}

class SaveCarregando extends SaveState {}

class SaveSucesso extends SaveState {}

class SaveErro extends SaveState {
  Failure erro;

  SaveErro(this.erro);
}
