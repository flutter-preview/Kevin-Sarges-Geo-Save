import 'package:flutter/material.dart';
import 'package:geosave/app/common/routes/app_routes.dart';
import 'package:geosave/app/features/map/presenter/map_screen.dart';
import 'package:geosave/app/features/save/presenter/save_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.map: (context) => const MapScreen(),
        AppRoutes.save: (context) => const SaveScreen(),
      },
    );
  }
}
