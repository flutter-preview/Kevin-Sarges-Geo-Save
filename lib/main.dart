import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:geosave/app/common/inject/inject_dependecy.dart';
import 'package:geosave/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  InjectDependecy.init();
  runApp(const MyApp());
}
