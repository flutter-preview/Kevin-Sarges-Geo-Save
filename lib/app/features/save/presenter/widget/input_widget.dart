import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  InputWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
  });

  String label;
  String hintText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'O campo esta vazio';
        }
        return null;
      },
    );
  }
}
