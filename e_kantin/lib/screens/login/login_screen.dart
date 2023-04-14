import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/rounded_button.dart';
import '../verification/verification_screen.dart';

class ScreenArguments {
  final String phone;
  const ScreenArguments(this.phone);
}

class LoginScreen extends StatelessWidget {
  //ini buat assisng phone number
  String phoneNumber = '';

  static String routeName = '/login';
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: size.width * 0.6,
                        child: const Text(
                          "Welcome to E-Kantin",
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
                    SizedBox(
                      width: size.width * 0.7,
                      child: TextFormField(
                        onFieldSubmitted: (phoneNum) {
                          //asign phoneNumber jadi phoneNum
                          phoneNumber = phoneNum;

                          //ScreenArguments.from(phoneNum);
                          return;
                        },
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: Text(
                              "+62",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(13),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: SizedBox(
                        width: size.width * 0.6,
                        child: const Text(
                          'Dengan ketukan “Masuk” anda menyetujui syarat dan ketentuan',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    RoundedButton(
                      width: size.width * 0.8,
                      text: 'Masuk',
                      press: () {
                        Navigator.pushNamed(
                          context,
                          VerificationScreen.routeName,
                          arguments: ScreenArguments(phoneNumber),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        width: size.width * 0.6,
                        child: const Text(
                          'Pengguna Baru? Daftar di sini',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
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
