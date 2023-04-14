import 'package:flutter/material.dart';
import 'package:e_kantin/screens/welcome/components/background.dart';

import '../../../components/rounded_button.dart';
import '../../login/login_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: size.width * 0.2,
              height: size.width * 0.2,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "assets/images/logo.png",
                width: size.width * 0.1,
                height: size.width * 0.1,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            const Text(
              "Get Your Food Delivered to Your Class",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Text(
              "The best delivery app in school for delivering your daily food",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            RoundedButton(
              width: size.width * 0.4,
              text: "Shop Now",
              press: () {
                Navigator.pushNamed(
                  context,
                  LoginScreen.routeName,
                );
              },
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
