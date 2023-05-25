import 'package:dropdown_search/dropdown_search.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/rounded_button.dart';
import '../../constants.dart';

class DataRegister extends StatefulWidget {
  static String routeName = '/dataregist';
  const DataRegister({super.key});

  @override
  State<DataRegister> createState() => _DataRegisterState();
}

class _DataRegisterState extends State<DataRegister> {
  final TextEditingController textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> schoolsName = [
    'SMK Telkom Jakarta',
    'Sekolah Menegah Kejuruan Cinta Kasih Tzu Chi',
    'Sekolah Kemana Asdjefss Kamal',
    'Sekolah Katholik Keren Abiezz',
    'Sekolah Menengah Atas Telkom Jaya Jaya Jaya',
    'Sekolah Masanfiuahofihaundlqwa ajshfiuasdda',
    'Sekolah gj2r8tfwef jivhoiasd',
    'Sekolah ahfoisiadjaoih ajshfiuasdda',
    'Sekolah Masanfiuahofihaundlqwa sjdsahdsda',
    'Sekolah Mengenah Kekiri Dikit',
    'Sekolah Menengah Kekanan',
    'Sekolah Masanfiuahofihaundlqwa ajshfiuasdda',
    'Sekolah gj2r8tfwef jivhoiasd',
    'Sekolah ahfoisiadjaoih ajshfiuasdda',
    'Sekolah Masanfiuahofihaundlqwa sjdsahdsda',
  ];

  String email = '';
  String name = '';
  String school = 'SMK Telkom Jakarta';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
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
                          "Welcome To \nE-Kantin",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenHeight(42),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.02,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.7,
                      height: SizeConfig.screenHeight * 0.4,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DropdownButtonFormField<String>(
                              menuMaxHeight: SizeConfig.screenHeight * 0.3,
                              isExpanded: true,
                              value: school,
                              hint: const Text('Pilih Sekolah'),
                              items: List.generate(
                                schoolsName.length,
                                (index) => DropdownMenuItem(
                                  value: schoolsName[index],
                                  child: Text(
                                    schoolsName[index],
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  school = value as String;
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down_rounded,
                                color: kMainColor,
                              ),
                              iconSize: getProportionateScreenHeight(30),
                              decoration: const InputDecoration(
                                labelText: 'Sekolah',
                              ),
                            ),
                            TextFormField(
                              controller: textController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return kPhoneNullError;
                                } else if (value.isNotEmpty &&
                                    value.length < 9) {
                                  return kPhoneTooShort;
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                labelText: 'Nama Lengkap',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: getProportionateScreenHeight(20),
                                fontWeight: FontWeight.w500,
                              ),
                              // decoration: InputDecoration(
                              //   prefixIcon: Padding(
                              //     padding: EdgeInsets.symmetric(
                              //       horizontal: getProportionateScreenWidth(5),
                              //     ),
                              //     child: Text(
                              //       "+62",
                              //       style: TextStyle(
                              //         fontSize: getProportionateScreenWidth(28),
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              //   ),
                              //   prefixIconConstraints: const BoxConstraints(
                              //     minWidth: 0,
                              //     minHeight: 0,
                              //   ),
                              // ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                                FilteringTextInputFormatter.singleLineFormatter,
                              ],
                              onChanged: (value) {
                                setState(
                                  () {
                                    email = value;
                                  },
                                );
                              },
                            ),
                            TextFormField(
                              // controller: textController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return kPhoneNullError;
                                } else if (value.isNotEmpty &&
                                    value.length < 9) {
                                  return kPhoneTooShort;
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: 'example@gmail.com',
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                                // alignLabelWithHint: false,
                              ),
                              style: TextStyle(
                                fontSize: getProportionateScreenHeight(20),
                                fontWeight: FontWeight.w500,
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                                FilteringTextInputFormatter.singleLineFormatter,
                              ],
                              onChanged: (value) {
                                setState(
                                  () {
                                    email = value;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.04,
                    ),
                    RoundedButton(
                      width: SizeConfig.screenWidth * 0.8,
                      text: 'Daftar',
                      press: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(25),
                      ),
                      child: const SizedBox(
                          // child: Text.rich(
                          //   TextSpan(
                          //     children: [
                          //       const TextSpan(
                          //           text: 'Sudah Memiliki Akun? Masuk '),
                          //       TextSpan(
                          //         text: 'disini',
                          //         style: const TextStyle(color: kMainColor),
                          //         recognizer: TapGestureRecognizer()
                          //           ..onTap = () {
                          //             Navigator.pushNamed(
                          //               context,
                          //               LoginScreen.routeName,
                          //             );
                          //           },
                          //       ),
                          //     ],
                          //   ),
                          //   style: const TextStyle(fontWeight: FontWeight.w500),
                          // ),
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
