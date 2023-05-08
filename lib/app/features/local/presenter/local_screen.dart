import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geosave/app/common/entity/local_entity.dart';
import 'package:geosave/app/common/routes/app_routes.dart';
import 'package:geosave/app/features/local/presenter/controller/local_cubit.dart';
import 'package:geosave/app/features/local/presenter/controller/local_state.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocalScreen extends StatefulWidget {
  const LocalScreen({
    Key? key,
    required this.local,
    required this.andar,
  }) : super(key: key);

  final LocalEntity local;
  final String andar;

  @override
  State<LocalScreen> createState() => _LocalScreenState();
}

class _LocalScreenState extends State<LocalScreen> {
  final _cubit = GetIt.I.get<LocalCubit>();

  late GoogleMapController _controller;

  bool _clickButton = false;

  _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.local.nomeLocal,
        ),
      ),
      body: SafeArea(
        child: BlocListener<LocalCubit, LocalState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state is LocalErro) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Erro ao deletar o local 🤔'),
                ),
              );

              return;
            }

            if (state is LocalSucesso) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Local deletado com sucesso 🙂'),
                ),
              );

              Navigator.popAndPushNamed(context, AppRoutes.map);
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
                      widget.local.lat,
                      widget.local.lon,
                    ),
                    zoom: 20,
                  ),
                  onMapCreated: _onMapCreated,
                  markers: {
                    Marker(
                      markerId: MarkerId(widget.local.nomeLocal),
                      position: LatLng(
                        widget.local.lat,
                        widget.local.lon,
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
                      Text(widget.local.tipoLocal),
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
                      Text(widget.local.nomeLocal),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _clickButton
                    ? null
                    : () {
                        _cubit.delete(widget.local.id, widget.andar);
                        setState(() {
                          _clickButton = true;
                        });
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: _clickButton
                    ? const SizedBox(
                        width: 10,
                        height: 10,
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : const Text('Deletar local'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
