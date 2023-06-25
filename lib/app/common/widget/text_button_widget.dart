import 'package:flutter/material.dart';
import 'package:geosave/app/common/colors/colors_app.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: ColorsApp.blue100,
              fontSize: 15,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: ColorsApp.blue100,
            size: 16,
          )
        ],
      ),
    );
  }
}
