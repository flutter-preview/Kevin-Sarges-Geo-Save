import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geosave/app/features/local/domain/usecase/delete_local_usecase.dart';
import 'package:geosave/app/features/local/domain/usecase/update_nome_usecase.dart';
import 'package:geosave/app/features/local/presenter/controller/local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit({
    required this.deleteLocalUseCase,
    required this.updateNomeUseCase,
  }) : super(LocalInitial());

  final DeleteLocalUseCase deleteLocalUseCase;
  final UpdateNomeUseCase updateNomeUseCase;

  Future<void> delete(String id) async {
    emit(LocalCarregando());

    final result = await deleteLocalUseCase(id);

    result.fold(
      (erro) => emit(LocalErro(erro)),
      (_) => emit(LocalSucesso()),
    );
  }

  Future<void> update(String id, String novoNome) async {
    emit(LocalCarregando());

    final result = await updateNomeUseCase(id, novoNome);

    result.fold(
      (erro) => emit(LocalErro(erro)),
      (_) => emit(LocalSucesso()),
    );
  }
}
