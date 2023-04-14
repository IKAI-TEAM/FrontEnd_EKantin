import 'dart:async';
import 'package:e_kantin/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(
        context,
        WelcomeScreen.routeName,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width * 0.25,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/icons/logo.png",
            ),
          )),
        ),
      ),
    );
  }
}
