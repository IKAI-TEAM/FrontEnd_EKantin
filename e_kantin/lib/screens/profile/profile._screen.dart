import 'package:e_kantin/components/fab.dart';
import 'package:e_kantin/components/navbar.dart';
import 'package:e_kantin/constants.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List assets = [
      'assets/icons/active/user.png',
      'assets/icons/active/user.png',
      'assets/icons/active/user.png',
      'assets/icons/active/user.png',
    ];

    List text = ['Profile', 'Notifikasi', 'Pengaturan', 'Log Out'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenHeight(26),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(getProportionateScreenHeight(25)),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: SizeConfig.screenHeight * 0.22,
              height: SizeConfig.screenHeight * 0.22,
              decoration: BoxDecoration(
                color: kTextColor.withOpacity(0.5),
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage('assets/images/avatar.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(10),
              ),
              height: getProportionateScreenHeight(85),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'E-Kantin Demo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(24),
                    ),
                  ),
                  Text(
                    'demoekantin@ikai.team',
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(10),
              ),
              child: Column(
                children: [
                  ...List.generate(
                    assets.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: getProportionateScreenHeight(20),
                          ),
                          padding: EdgeInsets.all(
                            getProportionateScreenHeight(15),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: getProportionateScreenHeight(15),
                                    ),
                                    child: SizedBox(
                                      width: getProportionateScreenHeight(30),
                                      child: Center(
                                        child: Image(
                                          image: AssetImage(assets[index]),
                                          height:
                                              getProportionateScreenHeight(20),
                                          width:
                                              getProportionateScreenHeight(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    text[index],
                                    style: TextStyle(
                                      fontSize:
                                          getProportionateScreenHeight(18),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black87,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: const Fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NavBar(currentTab: 3),
    );
  }
}
