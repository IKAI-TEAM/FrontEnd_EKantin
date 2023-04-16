import 'package:flutter/material.dart';
import 'package:e_kantin/screens/splash/splash_screen.dart';
import 'package:e_kantin/constants.dart';
import 'package:e_kantin/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        fontFamily: 'DM Sans',
        primaryColor: kMainColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
