import 'package:e_kantin/screens/activity/activity_screen.dart';
import 'package:e_kantin/screens/chat/chat_screen.dart';
import 'package:e_kantin/screens/home/home_screen.dart';
import 'package:e_kantin/screens/login/login_screen.dart';
import 'package:e_kantin/screens/menu/menu_screen.dart';
import 'package:e_kantin/screens/profile/profile._screen.dart';
import 'package:e_kantin/screens/splash/splash_screen.dart';
import 'package:e_kantin/screens/success/success_screen.dart';
import 'package:e_kantin/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'screens/verification/verification_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  VerificationScreen.routeName: (context) => const VerificationScreen(),
  SuccessScreen.routeName: (context) => const SuccessScreen(),
  HomePage.routeName: (context) => const HomePage(),
  MenuScreen.routeName: (context) => const MenuScreen(),
  ActivityScreen.routeName: (context) => const ActivityScreen(),
  ChatScreen.routeName: (context) => const ChatScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
};
