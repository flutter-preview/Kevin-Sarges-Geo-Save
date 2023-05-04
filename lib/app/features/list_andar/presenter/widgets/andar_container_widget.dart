import 'package:flutter/material.dart';
import 'package:geosave/app/features/list_local/presenter/list_local_screen.dart';

class AndarContainerWidget extends StatelessWidget {
  const AndarContainerWidget({
    Key? key,
    required this.text,
    required this.width,
  }) : super(key: key);

  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListLocalScreen(andar: text),
          ),
        );
      },
      child: Container(
        width: width * 0.3,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 216, 216, 216),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
