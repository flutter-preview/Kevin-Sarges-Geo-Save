import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geosave/app/common/routes/app_routes.dart';
import 'package:geosave/app/features/save/presenter/controller/save_cubit.dart';
import 'package:geosave/app/features/save/presenter/controller/save_state.dart';
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
  // final _controllerTextTipoLocal = TextEditingController();
  // final _controllerTextNomeLocal = TextEditingController();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final bool _clickButton = false;

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
            child: Container()),
      ),
    );
  }
}
