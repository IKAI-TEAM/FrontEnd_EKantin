import 'dart:developer';

import 'package:e_kantin/models/auth/login_request_model.dart';
import 'package:e_kantin/services/api_services.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/form_error.dart';
import '../../components/rounded_button.dart';
import '../../constants.dart';
import '../verification/verification_screen.dart';

class ScreenArguments {
  final String phone;
  const ScreenArguments(this.phone);
}

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNum = "";
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
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
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(45),
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
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.04,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        // width: SizeConfig.screenWidth * 0.6,
                        child: Text(
                          "Welcome to \nE-Kantin",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(42),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.02,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        // width: SizeConfig.screenWidth * 0.6,
                        child: Text(
                          "Login dengan Nomor Telepon \nyang sudah terdaftar.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: getProportionateScreenWidth(18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.04,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.7,
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty && !errors.contains(kPhoneNullError)) {
                              setState(() => errors.add(kPhoneNullError) );
                              return kPhoneNullError;
                            } else if (value.isNotEmpty && value.length < 9) {
                              setState(() => errors.add(kPhoneTooShort) );
                              return kPhoneTooShort;
                            }
                            return null;
                          },
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(28),
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(5),
                              ),
                              child: Text(
                                "+62",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(28),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(12),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            setState(
                              () {
                                phoneNum = value;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    // INI BUAT CUSTOM ERROR TEXT
                    // FormError(errors: errors),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(30)),
                      child: const SizedBox(
                        // width: SizeConfig.screenWidth * 0.6,
                        child: Text(
                          'Dengan ketukan “Masuk” anda \nmenyetujui syarat dan ketentuan',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.1,
                    ),
                    RoundedButton(
                      width: SizeConfig.screenWidth * 0.8,
                      text: 'Masuk',
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();

                          LoginRequestModel model = LoginRequestModel(
                              phoneNumber: int.parse(phoneNum));

                          APIService.login(model).then((response) => {
                            if(response) {
                              Navigator.pushNamed(context, VerificationScreen.routeName, arguments: 
                                {
                                  "phone_number": phoneNum
                                },
                              )
                            }
                          });

                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(20)),
                      child: const SizedBox(
                        // width: SizeConfig.screenWidth * 0.6,
                        child: Text(
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
