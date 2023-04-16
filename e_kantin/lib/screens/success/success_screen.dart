import 'package:e_kantin/screens/login/login_screen.dart';
import 'package:e_kantin/screens/welcome/components/body.dart';
import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';

class SuccessScreen extends StatelessWidget {
  static String routeName = '/success';
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
