import 'package:dropdown_search/dropdown_search.dart';
import 'package:e_kantin/screens/success/success_screen.dart';
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
    'Sekolah Masanfiuahokfasafihaundlqwa ajshfiuasdda',
    'Sekolah gj2r8tfwef jivhfamboiasd',
    'Sekolah ahfoisiadjaoih ajshsadfiuasdda',
    'Sekolah Masanfasnviuahofihaundlqwa sjdsahdsda',
    'Sekolah Mengenah Kekiri Dikit',
    'Sekolah Menengah Kekanan',
    'Sekolah Masanfiuahofihssaaundlqwa ajshfiuasdda',
    'Sekolah gj2r8bntfwef jivhofniasd',
    'Sekolah ahfoisiadjvjnaoih ajshfiuasdda',
    'Sekolah Masanfiuahofihavbkundlqwa sjdsahdsda',
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
                      height: SizeConfig.screenHeight * 0.015,
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
                      height: SizeConfig.screenHeight * 0.03,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.35,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DropdownSearch<String>(
                              dropdownButtonProps: DropdownButtonProps(
                                iconSize: getProportionateScreenHeight(30),
                                icon: const Icon(Icons.arrow_drop_down_rounded),
                                focusColor: kMainColor,
                              ),
                              popupProps: PopupProps.menu(
                                showSearchBox: true,
                                searchFieldProps: TextFieldProps(
                                  decoration: InputDecoration(
                                    border: const UnderlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.search_rounded,
                                      size: getProportionateScreenHeight(20),
                                    ),
                                    focusColor: kMainColor,
                                  ),
                                ),
                                disabledItemFn: (String s) => s.startsWith('I'),
                                searchDelay: const Duration(
                                    seconds: 0, milliseconds: 10),
                              ),
                              items: schoolsName,
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  labelText: "Sekolah",
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: getProportionateScreenHeight(20),
                                    color: kTextColor,
                                  ),
                                  focusColor: kMainColor,
                                ),
                              ),
                              onChanged: print,
                            ),
                            TextFormField(
                              controller: textController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return kPhoneNullError;
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Nama Lengkap',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: getProportionateScreenHeight(20),
                                  color: kTextColor,
                                ),
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
                                    name = value;
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
                              decoration: InputDecoration(
                                hintText: 'example@gmail.com',
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: getProportionateScreenHeight(20),
                                  color: kTextColor,
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
                      height: SizeConfig.screenHeight * 0.1,
                    ),
                    RoundedButton(
                      width: SizeConfig.screenWidth * 0.8,
                      text: 'Daftar',
                      press: () {
                        Navigator.pushNamed(context, SuccessScreen.routeName);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(25),
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
