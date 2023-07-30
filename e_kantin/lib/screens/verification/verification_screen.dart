// import 'package:e_kantin/screens/login/login_screen.dart';
import 'dart:developer';

import 'package:e_kantin/components/form_error.dart';
import 'package:e_kantin/models/auth/otp_validation_request_model.dart';
import 'package:e_kantin/screens/register/data_regist.dart';
import 'package:e_kantin/screens/success/success_screen.dart';
import 'package:e_kantin/services/api_services.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
import 'components/otpForm/otp_form.dart';

class VerificationScreen extends StatefulWidget {
  static String routeName = '/verification';
  const VerificationScreen({
    super.key,
  });

  static final _formKey = GlobalKey<FormState>();

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    final Map<String, Object>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>?;
    String phoneNumber = args?['phone_number'] as String;

    String formattedPhoneNumber = _formatPhoneNumber(phoneNumber);

    List<dynamic> otpValues = [];

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
                      key: VerificationScreen._formKey,
                      child: OtpForm(onOtpFormComplete: (otpValues) {
                        otpValues = otpValues;
                      }),
                    ),
                    FormError(errors: errors),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.05,
                    ),
                    RoundedButton(
                      width: SizeConfig.screenWidth * 0.8,
                      text: 'Verifikasi',
                      press: () {
                        Navigator.pushNamed(
                          context,
                          SuccessScreen.routeName,
                        );
                        //   if (VerificationScreen._formKey.currentState!
                        //       .validate()) {
                        //     log(otpValues.toString());
                        //     log("saved");
                        //     VerificationScreen._formKey.currentState!.save();

                        //     if (!otpValues.contains(null)) {
                        //       OtpValidationRequestModel model =
                        //           OtpValidationRequestModel(
                        //               otp: _getOtpValues(otpValues));

                        //       APIService.otp(model).then(
                        //         (response) => {
                        //           if (response == 1)
                        //             {
                        //               Navigator.pushNamed(
                        //                 context,
                        //                 SuccessScreen.routeName,
                        //               ),
                        //             }
                        //           else if (response == 2)
                        //             {
                        //               Navigator.pushNamed(
                        //                   context, DataRegister.routeName),
                        //             }
                        //           else
                        //             {setState(() => errors.add('OTP Salah'))}
                        //         },
                        //       );
                        //     } else {
                        //       setState(() => errors.add("ADA YANG BELUM DIISI"));
                        //     }
                        //   } else {
                        //     setState(() => errors.add("Invalid"));
                        //   }
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

  int _getOtpValues(otpValues) {
    String otpString = otpValues.join();
    String numericString = otpString.replaceAll(RegExp('[^0-9]'), '');
    log(otpString);
    int otpResult = int.parse(numericString);
    try {
      otpResult = int.parse(numericString);
    } catch (e) {
      // invalid
    }

    return otpResult;
  }

  String _formatPhoneNumber(String phoneNumber) {
    return phoneNumber.length < 11
        ? "${phoneNumber.substring(0, 3)}-${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}"
        : "${phoneNumber.substring(0, 3)}-${phoneNumber.substring(3, 7)}-${phoneNumber.substring(7)}";
  }
}
