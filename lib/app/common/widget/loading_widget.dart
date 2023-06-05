import 'package:flutter/material.dart';
import 'package:geosave/app/common/colors/colors_app.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: ColorsApp.green100,
    );
  }
}
