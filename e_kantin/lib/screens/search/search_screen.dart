import 'package:e_kantin/components/fab.dart';
import 'package:e_kantin/components/navbar.dart';
import 'package:e_kantin/screens/home/components/search_field.dart';
import 'package:e_kantin/screens/home/components/section_title.dart';
import 'package:e_kantin/screens/menu/menu_screen.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = '/search';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            SectionTitle(
              tap: false,
              text: "Pencarian Terbaru",
              press: () {
                Navigator.pushNamed(context, MenuScreen.routeName);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(20),
                horizontal: getProportionateScreenHeight(20),
              ),
              child: Row(
                children: [
                  Container(
                    height: SizeConfig.screenHeight * 0.18,
                    width: SizeConfig.screenWidth * 0.35,
                    color: Colors.amber,
                    child: Column(
                      children: [
                        Container(
                          height: SizeConfig.screenHeight * 0.12,
                          width: SizeConfig.screenWidth * 0.35,
                          color: Colors.black,
                        ),
                        Text('data'),
                        Text('data'),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(15),
          ),
          child: Text(
            'Search',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenHeight(26),
            ),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: SearchField(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        // centerTitle: true,
      ),
      floatingActionButton: const Fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NavBar(currentTab: 1),
    );
  }
}
