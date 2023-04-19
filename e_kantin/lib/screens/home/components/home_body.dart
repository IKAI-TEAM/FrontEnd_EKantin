import 'package:e_kantin/constants.dart';
import 'package:e_kantin/models/product.dart';
import 'package:e_kantin/screens/home/components/categories.dart';
import 'package:e_kantin/screens/home/components/home_header.dart';
import 'package:e_kantin/screens/home/components/product_card.dart';
import 'package:e_kantin/screens/home/components/search_field.dart';
import 'package:e_kantin/screens/home/components/section_title.dart';
import 'package:e_kantin/screens/home/components/special_offer.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'main_background.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBackground(
        child: SafeArea(
          child: Column(
            children: [
              const HomeHeader(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(5),
                ),
                child: const SearchField(),
              ),
              const SpecialOffer(),
              SectionTitle(
                text: "Categories",
                press: () {},
              ),
              const Categories(),
              SectionTitle(
                text: "Best Seller",
                press: () {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(20)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        demoProduct.length,
                        (index) => ProductCard(
                          product: demoProduct[index],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        onPressed: () {},
        backgroundColor: kMainColor,
        child: Image.asset('assets/icons/lunch-box.png',
            width: getProportionateScreenWidth(30)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: kMainColor,
        unselectedItemColor: const Color(0xffDBDBDB),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps_rounded),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
