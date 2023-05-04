import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geosave/app/features/list_andar/presenter/controller/list_andar_cubit.dart';
import 'package:geosave/app/features/list_andar/presenter/controller/list_andar_state.dart';
import 'package:geosave/app/features/list_andar/presenter/widgets/andar_container_widget.dart';
import 'package:get_it/get_it.dart';

class ListAndarScreen extends StatefulWidget {
  const ListAndarScreen({Key? key}) : super(key: key);

  @override
  State<ListAndarScreen> createState() => _ListAndarScreenState();
}

class _ListAndarScreenState extends State<ListAndarScreen> {
  final _cubit = GetIt.I.get<ListAndarCubit>();

  @override
  void initState() {
    super.initState();

    _cubit.listAndar();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Andares'),
      ),
      body: SafeArea(
        child: BlocBuilder<ListAndarCubit, ListAndarState>(
          bloc: _cubit,
          builder: (context, state) {
            if (state is ListAndarCarregando) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }

            if (state is ListAndarErro) {
              return Center(
                child: Text(state.erro.errorMessage),
              );
            }

            if (state is ListAndarSucesso) {
              return ListView.separated(
                itemCount: state.andares.length,
                padding: const EdgeInsets.fromLTRB(
                  12,
                  20,
                  12,
                  0,
                ),
                itemBuilder: (context, index) {
                  return AndarContainerWidget(
                    text: state.andares[index].andar,
                    width: width,
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              );
            }

            return Container(
              color: Colors.amber,
            );
          },
        ),
      ),
    );
  }
}
