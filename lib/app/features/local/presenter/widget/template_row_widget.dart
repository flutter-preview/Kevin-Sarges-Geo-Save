import 'package:flutter/material.dart';

class TemplateRowWidget extends StatelessWidget {
  const TemplateRowWidget({
    super.key,
    required this.widget,
  });

  final List<Widget> widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget,
    );
  }
}
