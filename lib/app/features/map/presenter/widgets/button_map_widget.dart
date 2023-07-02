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
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 50,
        ),
        decoration: BoxDecoration(
          color: ColorsApp.green150,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: ColorsApp.white100,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
