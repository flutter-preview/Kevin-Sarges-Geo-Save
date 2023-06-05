import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geosave/app/common/model/local_model.dart';
import 'package:geosave/app/features/save/domain/usecase/save_local_usecase.dart';
import 'package:geosave/app/features/save/presenter/controller/save_state.dart';

class SaveCubit extends Cubit<SaveState> {
  SaveCubit({required this.saveLocalUseCase}) : super(SaveInitial());

  final SaveLocalUseCase saveLocalUseCase;

  Future<void> saveLocal(LocalModel local) async {
    emit(SaveCarregando());

    final result = await saveLocalUseCase(local);

    result.fold(
      (erro) => emit(SaveErro(erro)),
      (_) => emit(SaveSucesso()),
    );
  }
}
