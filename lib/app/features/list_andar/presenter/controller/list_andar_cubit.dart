import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geosave/app/features/list_andar/domain/usecase/get_list_andar_usecase.dart';
import 'package:geosave/app/features/list_andar/presenter/controller/list_andar_state.dart';

class ListAndarCubit extends Cubit<ListAndarState> {
  ListAndarCubit({
    required this.getListAndarUseCase,
  }) : super(ListAndarInital());

  final GetListAndarUseCase getListAndarUseCase;

  Future<void> listAndar() async {
    emit(ListAndarCarregando());

    final result = await getListAndarUseCase();

    result.fold(
      (erro) => emit(ListAndarErro(erro)),
      (sucesso) => emit(ListAndarSucesso(sucesso)),
    );
  }
}
