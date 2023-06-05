import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geosave/app/features/list_local/domain/usecase/get_locais_usecase.dart';
import 'package:geosave/app/features/list_local/presenter/controller/list_local_state.dart';

class ListLocalCubit extends Cubit<ListLocalState> {
  ListLocalCubit({
    required this.getLocaisUseCase,
  }) : super(ListLocalInitial());

  final GetLocaisUseCase getLocaisUseCase;

  Future<void> getLocais() async {
    emit(ListLocalCarregando());

    final result = await getLocaisUseCase();

    result.fold(
      (erro) => emit(ListLocalErro(erro)),
      (locais) => emit(
        ListLocalSucesso(locais),
      ),
    );
  }
}
