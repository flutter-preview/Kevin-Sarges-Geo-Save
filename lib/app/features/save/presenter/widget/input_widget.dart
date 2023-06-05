import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        label: Text(label),
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
