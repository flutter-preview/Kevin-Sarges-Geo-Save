import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geosave/app/common/model/local_model.dart';
import 'package:geosave/app/common/routes/app_routes.dart';
import 'package:geosave/app/common/strings/list_icon_local.dart';
import 'package:geosave/app/features/save/presenter/controller/save_cubit.dart';
import 'package:geosave/app/features/save/presenter/controller/save_state.dart';
import 'package:geosave/app/common/strings/list_andar.dart';
import 'package:geosave/app/features/save/presenter/widget/input_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class SaveScreen extends StatefulWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  final _cubit = GetIt.I.get<SaveCubit>();
  final _controllerTextTipoLocal = TextEditingController();
  final _controllerTextNomeLocal = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> _iconLocais = ListIconLocal.listIconLocal.first;
  String _andares = ListAndares.andares.first;
  bool _clickButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salvar Localização'),
      ),
      body: SafeArea(
        child: BlocListener<SaveCubit, SaveState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state is SaveErro) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Erro ao salvar o local 🤔 '),
                ),
              );

              return;
            }

            if (state is SaveSucesso) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Local salvo com sucesso 🙂'),
                ),
              );

              Navigator.pushReplacementNamed(context, AppRoutes.list);
              return;
            }
          },
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              10,
              15,
              10,
              0,
            ),
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Selecione o icone do local: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: DropdownButton<Map<String, dynamic>>(
                              value: _iconLocais,
                              dropdownColor: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                              underline: Container(height: 0),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Colors.white,
                              ),
                              items: ListIconLocal.listIconLocal.map((local) {
                                return DropdownMenuItem(
                                  value: local,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        local['marker'],
                                        fit: BoxFit.cover,
                                        width: 15,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        local['tipoLocal'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (Map<String, dynamic>? value) {
                                setState(() {
                                  _iconLocais = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Selecione o andar do local: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: DropdownButton(
                              value: _andares,
                              dropdownColor: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                              underline: Container(height: 0),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Colors.white,
                              ),
                              items: ListAndares.andares
                                  .map(
                                    (andar) => DropdownMenuItem(
                                      value: andar,
                                      child: Text(
                                        andar,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _andares = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputWidget(
                      controller: _controllerTextTipoLocal,
                      hintText: 'Ex: Sala',
                      label: 'Qual o tipo do local? ',
                    ),
                    const SizedBox(height: 20),
                    InputWidget(
                      controller: _controllerTextNomeLocal,
                      hintText: 'E-106',
                      label: 'Qual no nome da Sala? ',
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _clickButton == false
                          ? () async {
                              if (_formKey.currentState!.validate()) {
                                final local =
                                    await Geolocator.getCurrentPosition();
                                _cubit.saveLocal(
                                  _andares,
                                  LocalModel(
                                    id: uuid.v4(),
                                    lat: local.latitude,
                                    lon: local.longitude,
                                    marker: _iconLocais['marker'],
                                    nomeLocal: _controllerTextNomeLocal.text,
                                    tipoLocal: _controllerTextTipoLocal.text,
                                  ),
                                );

                                setState(() {
                                  _clickButton = true;
                                });
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 30,
                        ),
                      ),
                      child: _clickButton
                          ? const SizedBox(
                              width: 10,
                              height: 10,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Salvar',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
