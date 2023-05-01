import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geosave/app/features/map/domain/usecase/get_geo_localizacao_usuario_usecase.dart';
import 'package:geosave/app/features/map/presenter/controller/map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit({
    required this.getGeoLocalizacaoUsuarioUseCase,
  }) : super(MapIntial());

  final GetGeoLocalizacaoUsuarioUseCase getGeoLocalizacaoUsuarioUseCase;

  Future<void> localizacaoUsuario() async {
    emit(MapCarregando());

    final result = await getGeoLocalizacaoUsuarioUseCase();

    result.fold(
      (erro) => emit(MapErro(erro)),
      (sucesso) => emit(
        MapSucesso(sucesso.latitude, sucesso.longitude),
      ),
    );
  }
}
