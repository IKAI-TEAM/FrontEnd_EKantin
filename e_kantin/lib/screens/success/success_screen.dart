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
              Positioned(
                top: 45,
                left: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
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
                    ),
                    Image.asset(
                      "assets/images/sukses.png",
                      width: size.width * 0.7,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: size.width * 0.6,
                        child: const Text(
                          "Masuk Berhasil!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: size.width * 0.6,
                        child: const Text(
                          "Proses masuk yang anda lakukan telah berhasil, anda dapat lanjut ke Halaman Utama",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
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
