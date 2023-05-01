import 'package:flutter/material.dart';

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
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.red),
        )),
      ),
      child: Text(text),
    );
  }
}
