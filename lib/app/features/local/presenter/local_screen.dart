// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geosave/app/common/colors/colors_app.dart';
import 'package:geosave/app/common/entity/local_entity.dart';
import 'package:geosave/app/common/routes/app_routes.dart';
import 'package:geosave/app/features/local/presenter/controller/local_cubit.dart';
import 'package:geosave/app/features/local/presenter/controller/local_state.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geosave/app/features/local/presenter/widget/column_widget.dart';

class LocalScreen extends StatefulWidget {
  const LocalScreen({
    Key? key,
    required this.local,
  }) : super(key: key);

  final LocalEntity local;

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
        title: const Text('Local que você salvo'),
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

              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.map,
                (_) => false,
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
                  ColumnWidget(
                    title: 'Latitude:',
                    subtitle: widget.local.lat.toString(),
                  ),
                  ColumnWidget(
                    title: 'Longitude:',
                    subtitle: widget.local.lon.toString(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ColumnWidget(
                subtitle: widget.local.nomeLocal,
                title: 'Nome do local',
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _clickButton
                    ? null
                    : () {
                        _cubit.delete(widget.local.id);
                        setState(() {
                          _clickButton = true;
                        });
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.red100,
                ),
                child: _clickButton
                    ? const SizedBox(
                        width: 10,
                        height: 10,
                        child: CircularProgressIndicator(
                          color: ColorsApp.white100,
                        ),
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
