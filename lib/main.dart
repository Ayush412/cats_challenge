import 'package:flutter/material.dart';
import 'package:cats_challenge/core/injection/injection.dart';
import 'package:cats_challenge/core/router/routes.dart';

void main() {
  configureDependencies();
  runApp(const CatsApp());
}

class CatsApp extends StatefulWidget {
  const CatsApp({super.key});

  @override
  State<CatsApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<CatsApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
