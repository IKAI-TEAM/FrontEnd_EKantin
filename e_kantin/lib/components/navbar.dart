import 'package:e_kantin/constants.dart';
import 'package:e_kantin/screens/activity/activity_screen.dart';
import 'package:e_kantin/screens/chat/chat_screen.dart';
import 'package:e_kantin/screens/home/home_screen.dart';
import 'package:e_kantin/screens/profile/profile._screen.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.currentTab,
  });
  final int currentTab;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // int currentIndex = currentTab;
  List activePages = [];
  List pages = [
    HomePage.routeName,
    ChatScreen.routeName,
    ActivityScreen.routeName,
    ProfileScreen.routeName,
  ];

  @override
  void initState() {
    activePages = [
      ...List.generate(4, (index) {
        if (widget.currentTab == index) {
          return 'active';
        } else {
          return 'nonactive';
        }
      })
    ];
    super.initState();
  }

  void onTap(int index) {
    setState(() {
      // currentIndex = index;

      for (var i = 0; i < 4; i++) {
        activePages[i] = 'nonactive';
      }

      activePages[index] = 'active';

      Navigator.pushNamed(
        context,
        pages[index],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
      ),
      color: Colors.white,
      notchMargin: 0,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Material(
              color: Colors.white,
              child: Center(
                child: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      onTap(0);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/icons/${activePages[0]}/home.png',
                        ),
                        width: getProportionateScreenHeight(25),
                        height: getProportionateScreenHeight(25),
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: activePages[0] == 'active'
                              ? const Color(0xff3E84CE)
                              : const Color(0xff9DB2CE),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.white,
              child: Center(
                child: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      onTap(1);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/icons/${activePages[1]}/search.png',
                        ),
                        width: getProportionateScreenHeight(25),
                        height: getProportionateScreenHeight(25),
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: activePages[1] == 'active'
                              ? const Color(0xff3E84CE)
                              : const Color(0xff9DB2CE),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(20),
            ), //to make space for the floating button
            Material(
              color: Colors.white,
              child: Center(
                child: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      onTap(2);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/icons/${activePages[2]}/history.png',
                        ),
                        width: getProportionateScreenHeight(25),
                        height: getProportionateScreenHeight(25),
                      ),
                      Text(
                        'History',
                        style: TextStyle(
                          color: activePages[2] == 'active'
                              ? const Color(0xff3E84CE)
                              : const Color(0xff9DB2CE),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.white,
              child: Center(
                child: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      onTap(3);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/icons/${activePages[3]}/user.png',
                        ),
                        width: getProportionateScreenHeight(25),
                        height: getProportionateScreenHeight(25),
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: activePages[3] == 'active'
                              ? const Color(0xff3E84CE)
                              : const Color(0xff9DB2CE),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
