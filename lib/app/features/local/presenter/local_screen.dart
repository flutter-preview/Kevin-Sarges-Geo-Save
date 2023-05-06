import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geosave/app/common/entity/local_entity.dart';
import 'package:geosave/app/features/list_local/presenter/list_local_screen.dart';
import 'package:geosave/app/features/local/presenter/controller/local_cubit.dart';
import 'package:geosave/app/features/local/presenter/controller/local_state.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocalScreen extends StatelessWidget {
  LocalScreen({
    Key? key,
    required this.local,
    required this.andar,
  }) : super(key: key);

  final LocalEntity local;
  final String andar;
  final _cubit = GetIt.I.get<LocalCubit>();
  late GoogleMapController _controller;

  _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          local.nomeLocal,
        ),
      ),
      body: SafeArea(
        child: BlocListener<LocalCubit, LocalState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state is LocalSucesso) {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => ListLocalScreen(andar: andar),
                ),
              );
              return;
            }
          },
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              10,
              20,
              10,
              0,
            ),
            children: [
              const Text(
                'Local no Mapa: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 450,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      local.lat,
                      local.lon,
                    ),
                    zoom: 20,
                  ),
                  onMapCreated: _onMapCreated,
                  markers: {
                    Marker(
                      markerId: MarkerId(local.nomeLocal),
                      position: LatLng(
                        local.lat,
                        local.lon,
                      ),
                    ),
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tipo do local:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(local.tipoLocal),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nome do local:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(local.nomeLocal),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _cubit.delete(local.id!, andar);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('Deletar local'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
