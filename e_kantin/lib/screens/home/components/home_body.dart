import 'package:e_kantin/components/fab.dart';
import 'package:e_kantin/components/navbar.dart';
import 'package:e_kantin/screens/home/components/categories.dart';
import 'package:e_kantin/screens/home/components/home_header.dart';
import 'package:e_kantin/screens/home/components/product_view.dart';
import 'package:e_kantin/screens/home/components/section_title.dart';
import 'package:e_kantin/screens/home/components/special_offer.dart';
import 'package:e_kantin/screens/menu/menu_screen.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'main_background.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: Column(
            children: [
              const HomeHeader(),
              const SpecialOffer(),
              SectionTitle(
                tap: true,
                text: "Categories",
                press: () {},
              ),
              const Categories(),
              SectionTitle(
                tap: true,
                text: "Best Seller",
                press: () {
                  Navigator.pushNamed(context, MenuScreen.routeName);
                },
              ),
              const ProductCarousel(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const Fab(),
      bottomNavigationBar: const NavBar(
        currentTab: 0,
      ),
    );
  }
}
