import 'package:flutter/material.dart';
import 'package:presience_app/presentation/router/routes.dart';
import 'package:presience_app/presentation/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getRoute(),
      theme: appTheme,
    );
  }
}
