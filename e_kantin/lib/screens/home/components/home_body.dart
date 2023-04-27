import 'package:e_kantin/constants.dart';
import 'package:e_kantin/screens/activity/activity_screen.dart';
import 'package:e_kantin/screens/chat/chat_screen.dart';
import 'package:e_kantin/screens/home/components/categories.dart';
import 'package:e_kantin/screens/home/components/home_header.dart';
import 'package:e_kantin/screens/home/components/product_view.dart';
import 'package:e_kantin/screens/home/components/search_field.dart';
import 'package:e_kantin/screens/home/components/section_title.dart';
import 'package:e_kantin/screens/home/components/special_offer.dart';
import 'package:e_kantin/screens/home/home_screen.dart';
import 'package:e_kantin/screens/menu/menu_screen.dart';
import 'package:e_kantin/screens/profile/profile._screen.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'main_background.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBackground(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            maintainBottomViewPadding: true,
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        onPressed: () {},
        backgroundColor: kMainColor,
        child: Image.asset('assets/icons/lunch-box.png',
            width: getProportionateScreenWidth(30)),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;
  List pages = [
    HomePage.routeName,
    ActivityScreen.routeName,
    ChatScreen.routeName,
    ProfileScreen.routeName,
  ];
  void onTap(int index) {
    setState(() {
      // currentIndex = index;
      Navigator.pushNamed(
        context,
        pages[index],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
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
          icon: Icon(Icons.calendar_today_rounded),
          label: "Activity",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps_rounded),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
