import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _TempoSplash();
}

class _TempoSplash extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A0072),
      body: Center(
 child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
    children: [
  Image.asset(
        'assets/imagens/logo.png',
        width: 350,
        height: 350,
      ),
      SizedBox(height: 5),
      CircularProgressIndicator(
        color: Color(0xFF880E4F),
      ),
    ],
  ),
),
    );
  }
}