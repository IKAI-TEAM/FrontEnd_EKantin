import 'package:e_kantin/components/fab.dart';
import 'package:e_kantin/components/navbar.dart';
import 'package:e_kantin/components/rounded_button.dart';
import 'package:e_kantin/constants.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  static String routeName = "/activity";
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Daftar Pesanan',
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
          bottom: const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: 'Dalam Proses',
              ),
              Tab(
                text: 'Riwayat Pesanan',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            History(isHistory: false),
            History(
              isHistory: true,
            ),
          ],
        ),
        floatingActionButton: const Fab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const NavBar(currentTab: 2),
      ),
    );
  }
}

class History extends StatelessWidget {
  final bool isHistory;
  const History({
    super.key,
    required this.isHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenHeight(20)),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.all(getProportionateScreenHeight(10)),
                  width: SizeConfig.screenHeight * 0.17,
                  height: SizeConfig.screenHeight * 0.15,
                  decoration: BoxDecoration(
                    color: kTextColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/burger.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.screenWidth * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Original Burger',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: getProportionateScreenHeight(20),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '24 Jul 2023, 11:55',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: getProportionateScreenHeight(13),
                              color: kTextColor.withOpacity(1),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(5)),
                          Text(
                            isHistory ? 'Selesai' : '15 menit',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: getProportionateScreenHeight(13),
                              color: const Color(0xff23AA49),
                            ),
                          ),
                        ],
                      ),
                      const Text('1 Burger Original, Large, 1 esteh'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          isHistory
                              ? RoundedButton(
                                  text: 'Beli Lagi',
                                  press: () {},
                                  width: getProportionateScreenWidth(80),
                                  vPadding: 5,
                                  hPadding: 5,
                                  border: 10,
                                  fontSize: getProportionateScreenHeight(12),
                                  margin: 5,
                                )
                              : Padding(
                                  padding: EdgeInsets.only(
                                    top: getProportionateScreenHeight(25),
                                  ),
                                  child: Text(
                                    'Rp 15.000',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          getProportionateScreenHeight(20),
                                    ),
                                  ),
                                ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
