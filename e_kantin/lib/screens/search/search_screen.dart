import 'package:e_kantin/components/fab.dart';
import 'package:e_kantin/components/navbar.dart';
import 'package:e_kantin/models/product.dart';
import 'package:e_kantin/screens/home/components/product_view.dart';
import 'package:e_kantin/screens/home/components/search_field.dart';
import 'package:e_kantin/screens/home/components/section_title.dart';
import 'package:e_kantin/screens/menu/menu_screen.dart';
import 'package:e_kantin/screens/search/components/product_list.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = '/search';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
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
              const ProductCarousel(),
              SectionTitle(
                tap: false,
                text: "Rekomendasi Untuk Anda",
                press: () {
                  Navigator.pushNamed(context, MenuScreen.routeName);
                },
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(20),
                ),
                child: Column(
                  children: [
                    ...List.generate(
                      demoProduct.length,
                      (index) => ProductInSearch(
                        product: demoProduct[index],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
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
