import 'package:e_kantin/dismiss_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:e_kantin/screens/splash/splash_screen.dart';
import 'package:e_kantin/constants.dart';
import 'package:e_kantin/routes.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Auth',
        theme: ThemeData(
            fontFamily: 'DM Sans',
            primaryColor: kMainColor,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: Colors.white,
                // Status bar brightness (optional)
                statusBarIconBrightness:
                    Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
            )),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
