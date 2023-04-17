import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
import '../home/home_screen.dart';

class SuccessScreen extends StatelessWidget {
  static String routeName = '/success';
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false, // set it to false
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                    Image.asset(
                      "assets/images/otp.png",
                      width: size.width * 0.7,
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: size.width * 0.6,
                        child: const Text(
                          "INI SUCCESS SCREEN",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 44,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: size.width * 0.6,
                        child: const Text(
                          "Login dengan Nomor Telepon yang sudah terdaftar.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    RoundedButton(
                      width: size.width * 0.8,
                      text: 'Lanjut ke Halaman Utama',
                      press: () {
                        Navigator.pushNamed(
                          context,
                          HomePage.routeName,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
