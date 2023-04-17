import 'package:e_kantin/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/welcome/welcome_screen.dart';
// import 'screens/verification/verification_screen.dart';
import 'screens/success/success_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  // VerificationScreen.routeName: (context) => VerificationScreen(),
  SuccessScreen.routeName: (context) => const SuccessScreen(),
  HomePage.routeName: (context) => const HomePage(),
};
