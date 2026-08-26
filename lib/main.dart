import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/doce_controller.dart';
import 'telas/splash.dart';
import 'telas/home.dart';
import 'telas/principal.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DoceController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rare Candy',

      initialRoute: '/',

      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const Principal(),
      },
    );
  }
}