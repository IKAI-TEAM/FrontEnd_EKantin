// import 'package:e_kantin/screens/login/login_screen.dart';
import 'package:e_kantin/screens/success/success_screen.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
import 'components/otpForm/otp_form.dart';

class VerificationScreen extends StatelessWidget {
  static String routeName = '/verification';
  // final String phone;
  const VerificationScreen({
    super.key,
    // required this.phone,
  });

  static final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Map<String, Object>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>?;
    String phoneNumber = args?['phone_number'] as String;
    // final TextEditingController putPhoneNumber =
    //     TextEditingController(text: phoneNumber ?? '');

    String formattedPhoneNumber = phoneNumber.length < 11
        ? "${phoneNumber.substring(0, 3)}-${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}"
        : "${phoneNumber.substring(0, 3)}-${phoneNumber.substring(3, 7)}-${phoneNumber.substring(7)}";
    // final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: getProportionateScreenHeight(45),
                left: getProportionateScreenWidth(10),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(40),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                      width: SizeConfig.screenWidth * 0.2,
                      height: SizeConfig.screenWidth * 0.2,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: SizeConfig.screenWidth * 0.1,
                        height: SizeConfig.screenWidth * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Image.asset(
                      "assets/images/otp.png",
                      width: SizeConfig.screenWidth * 0.7,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.04,
                    ),
                    SizedBox(
                      // width: SizeConfig.screenWidth * 0.7,
                      child: Text(
                        "Kami akan mengirimkan satu kali \nverifikasi dengan Nomer telepon ini",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenHeight(16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SizedBox(
                        // width: SizeConfig.screenWidth * 0.7,
                        child: Text(
                          "+62 $formattedPhoneNumber",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenHeight(18),
                          ),
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: const OtpForm(),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.05,
                    ),
                    RoundedButton(
                      width: SizeConfig.screenWidth * 0.8,
                      text: 'Masuk',
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.pushNamed(
                            context,
                            SuccessScreen.routeName,
                          );
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(20)),
                      child: const SizedBox(
                        // width: SizeConfig.screenWidth * 0.6,
                        child: Text(
                          'Tidak Menerima Kode? Kirim Ulang',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
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
