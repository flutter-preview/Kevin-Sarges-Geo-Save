// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geosave/app/common/colors/colors_app.dart';
import 'package:geosave/app/common/helpers/open_database.dart';
import 'package:geosave/app/common/routes/app_routes.dart';
import 'package:geosave/app/common/widget/loading_widget.dart';
import 'package:geosave/app/features/map/presenter/controller/map_cubit.dart';
import 'package:geosave/app/features/map/presenter/controller/map_state.dart';
import 'package:geosave/app/features/map/presenter/widgets/button_map_widget.dart';
import 'package:geosave/app/features/save/presenter/save_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _cubit = GetIt.I.get<MapCubit>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  late GoogleMapController _controller;
  final db = DatabaseHelper();

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sua localização'),
        backgroundColor: ColorsApp.green150,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsApp.green100,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.list);
            },
            child: const Text('Locais Salvos'),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<MapCubit, MapState>(
          bloc: _cubit,
          builder: (context, state) {
            if (state is MapCarregando) {
              return const Center(child: LoadingWidget());
            }

            if (state is MapErro) {
              return Center(
                child: Text(state.erro.errorMessage),
              );
            }

            if (state is MapSucesso) {
              return Scaffold(
                body: GoogleMap(
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
                ),
                floatingActionButton: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    0,
                    0,
                    10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ButtoMapWidget(
                        onPress: () {
                          _cubit.localizacaoUsuario();
                          _refreshIndicatorKey.currentState?.show();
                        },
                        text: 'Atualizar',
                      ),
                      const SizedBox(width: 12),
                      ButtoMapWidget(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SaveScreen(
                                lat: state.lat,
                                lon: state.lon,
                              ),
                            ),
                          );
                        },
                        text: 'Salvar',
                      ),
                    ],
                  ),
                ),
              );
            }

            return Container(
              color: ColorsApp.red100,
            );
          },
        ),
      ),
    );
  }
}
