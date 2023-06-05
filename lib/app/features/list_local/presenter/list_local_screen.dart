import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geosave/app/common/colors/colors_app.dart';
import 'package:geosave/app/common/widget/loading_widget.dart';
import 'package:geosave/app/features/list_local/presenter/controller/list_local_cubit.dart';
import 'package:geosave/app/features/list_local/presenter/controller/list_local_state.dart';
import 'package:geosave/app/features/list_local/presenter/widgets/local_container.dart';
import 'package:get_it/get_it.dart';

class ListLocalScreen extends StatefulWidget {
  const ListLocalScreen({Key? key}) : super(key: key);

  @override
  State<ListLocalScreen> createState() => _ListLocalScreenState();
}

class _ListLocalScreenState extends State<ListLocalScreen> {
  final _cubit = GetIt.I.get<ListLocalCubit>();

  @override
  void initState() {
    super.initState();

    _cubit.getLocais();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de locais'),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            final locais = _cubit.getLocais();
            return locais;
          },
          child: BlocBuilder<ListLocalCubit, ListLocalState>(
            bloc: _cubit,
            builder: (context, state) {
              if (state is ListLocalCarregando) {
                return const Center(
                  child: LoadingWidget(),
                );
              }

              if (state is ListLocalErro) {
                return Center(
                  child: Text(state.erro.errorMessage),
                );
              }

              if (state is ListLocalSucesso) {
                if (state.locais.isEmpty) {
                  return const Center(
                    child: Text(
                      'No moneto não tem nenhum local salvo !!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  return GridView.builder(
                    itemCount: state.locais.length,
                    padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return LocalContainer(
                        local: state.locais[index],
                      );
                    },
                  );
                }
              }

              return Container(
                color: ColorsApp.red100,
              );
            },
          ),
        ),
      ),
    );
  }
}
