import 'package:flutter/material.dart';
import 'package:geosave/app/common/entity/local_entity.dart';
import 'package:geosave/app/features/local/presenter/local_screen.dart';

class LocalContainer extends StatelessWidget {
  const LocalContainer({
    Key? key,
    required this.nomeLocal,
    required this.marker,
    required this.local,
    required this.andar,
  }) : super(key: key);

  final String nomeLocal;
  final String marker;
  final LocalEntity local;
  final String andar;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocalScreen(
              local: local,
              andar: andar,
            ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              marker,
              fit: BoxFit.cover,
              width: 25,
            ),
            Text(
              nomeLocal,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
