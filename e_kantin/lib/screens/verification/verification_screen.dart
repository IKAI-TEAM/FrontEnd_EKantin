import 'package:e_kantin/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../components/rounded_button.dart';
import 'components/otpForm/otp_form.dart';

class VerificationScreen extends StatefulWidget {
  static String routeName = '/verification';
  String phoneNum;
  VerificationScreen({required this.phoneNum, required String phoneNumber});

  @override
  _VerificationScreen createState() => _VerificationScreen(phoneNum);
}

class _VerificationScreen extends State<VerificationScreen> {
  _VerificationScreen(String phoneNum);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    print(args);
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
                    Image.asset(
                      "assets/images/otp.png",
                      width: size.width * 0.7,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SizedBox(
                      width: size.width * 0.7,
                      child: const Text(
                        "Kami akan mengirimkan satu kali verifikasi dengan Nomer telepon ini",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SizedBox(
                        width: size.width * 0.7,
                        child: Text(
                          phoneNum,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const OtpForm(),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    RoundedButton(
                      width: size.width * 0.8,
                      text: 'Masuk',
                      press: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return VerificationScreen(
                                phoneNum: '',
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        width: size.width * 0.6,
                        child: const Text(
                          'Tidak Menerima Kode? Kirim Ulang',
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
