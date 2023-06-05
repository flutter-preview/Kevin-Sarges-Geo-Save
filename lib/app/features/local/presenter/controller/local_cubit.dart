import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geosave/app/features/local/domain/usecase/delete_local_usecase.dart';
import 'package:geosave/app/features/local/presenter/controller/local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit({required this.deleteLocalUseCase}) : super(LocalInitial());

  final DeleteLocalUseCase deleteLocalUseCase;

  Future<void> delete(String id) async {
    emit(LocalCarregando());

    final result = await deleteLocalUseCase(id);

    result.fold(
      (erro) => emit(LocalErro(erro)),
      (_) => emit(LocalSucesso()),
    );
  }
}
