import 'package:flutter/material.dart';
import 'package:geosave/app/common/colors/colors_app.dart';

class ButtoMapWidget extends StatelessWidget {
  const ButtoMapWidget({
    super.key,
    required this.text,
    required this.onPress,
  });

  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.green100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(text),
    );
  }
}
