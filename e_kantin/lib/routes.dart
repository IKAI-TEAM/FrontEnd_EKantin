import 'package:e_kantin/screens/activity/activity_screen.dart';
import 'package:e_kantin/screens/cart/cart.dart';
import 'package:e_kantin/screens/search/search_screen.dart';
import 'package:e_kantin/screens/home/home_screen.dart';
import 'package:e_kantin/screens/login/login_screen.dart';
import 'package:e_kantin/screens/menu/menu_screen.dart';
import 'package:e_kantin/screens/payment/payment_success.dart';
import 'package:e_kantin/screens/profile/profile._screen.dart';
import 'package:e_kantin/screens/register/data_regist.dart';
import 'package:e_kantin/screens/register/register_screen.dart';
import 'package:e_kantin/screens/splash/splash_screen.dart';
import 'package:e_kantin/screens/success/success_screen.dart';
import 'package:e_kantin/screens/verification/verification_screen.dart';
import 'package:e_kantin/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  VerificationScreen.routeName: (context) => const VerificationScreen(),
  DataRegister.routeName: (context) => const DataRegister(),
  SuccessScreen.routeName: (context) => const SuccessScreen(),
  HomePage.routeName: (context) => const HomePage(),
  MenuScreen.routeName: (context) => const MenuScreen(),
  ActivityScreen.routeName: (context) => const ActivityScreen(),
  SearchScreen.routeName: (context) => const SearchScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  PaymentSuccess.routeName: (context) => const PaymentSuccess(),
};
