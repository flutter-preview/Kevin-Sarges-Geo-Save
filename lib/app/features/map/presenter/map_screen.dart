import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geosave/app/features/map/presenter/controller/map_cubit.dart';
import 'package:geosave/app/features/map/presenter/controller/map_state.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geosave/app/features/map/presenter/widgets/button_map_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _cubit = GetIt.I.get<MapCubit>();
  late GoogleMapController _controller;

  void _onCreatedMap(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  void initState() {
    super.initState();

    _cubit.localizacaoUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sua localização'),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Locais Salvos'),
            ),
          ],
        ),
        body: BlocBuilder<MapCubit, MapState>(
          bloc: _cubit,
          builder: (context, state) {
            if (state is MapCarregando) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            }

            if (state is MapErro) {
              return Center(
                child: Text(state.erro.errorMessage),
              );
            }

            if (state is MapSucesso) {
              return GoogleMap(
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    state.lat,
                    state.lon,
                  ),
                  zoom: 19,
                ),
                onMapCreated: _onCreatedMap,
              );
            }

            return Container(
              color: Colors.red,
            );
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ButtoMapWidget(
                onPress: () {},
                text: 'Atualizar',
              ),
              const SizedBox(width: 12),
              ButtoMapWidget(
                onPress: () {},
                text: 'Salvar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
