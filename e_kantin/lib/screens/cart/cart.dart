import 'package:e_kantin/components/rounded_button.dart';
import 'package:e_kantin/constants.dart';
import 'package:e_kantin/models/product.dart';
import 'package:e_kantin/screens/cart/components/cart_item.dart';
import 'package:e_kantin/screens/payment/payment_success.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = demoProduct[0];
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          width: SizeConfig.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CartItem(product: product),
                  CartItem(product: product),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        border: const OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Container(
                          padding: const EdgeInsets.all(5),
                          child: RoundedButton(
                            text: 'Pakai',
                            press: () {},
                            width: getProportionateScreenWidth(65),
                            fontSize: 12,
                            border: 5,
                            margin: 0,
                            hPadding: 0,
                            vPadding: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.09,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Item',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: getProportionateScreenHeight(16),
                                color: kTextColor,
                              ),
                            ),
                            Text(
                              'Rp 30.000',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: getProportionateScreenHeight(16),
                                color: kTextColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ongkos Kirim',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: getProportionateScreenHeight(16),
                                color: kTextColor,
                              ),
                            ),
                            Text(
                              'Gratis',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: getProportionateScreenHeight(16),
                                color: kTextColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: getProportionateScreenHeight(20),
                        ),
                      ),
                      Text(
                        'Rp 30.000',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: getProportionateScreenHeight(20),
                        ),
                      ),
                    ],
                  ),
                  RoundedButton(
                    text: 'Lanjut Bayar',
                    press: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return DraggableScrollableSheet(
                            maxChildSize: 0.65,
                            initialChildSize: 0.6,
                            minChildSize: 0.6,
                            expand: false,
                            builder: (context, scrollController) {
                              return SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(40),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(
                                          getProportionateScreenHeight(20),
                                        ),
                                        width: SizeConfig.screenWidth * 0.9,
                                        height: SizeConfig.screenHeight * 0.15,
                                        decoration: BoxDecoration(
                                          color: kTextColor.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/cookies.png',
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 10,
                                                horizontal:
                                                    getProportionateScreenWidth(
                                                  30,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '3123 0242 2341 2131',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          getProportionateScreenHeight(
                                                              16),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Metode Pembayaran',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          getProportionateScreenHeight(
                                                              16),
                                                      color: Colors.black87,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: getProportionateScreenHeight(15),
                                        ),
                                        padding: EdgeInsets.all(
                                          getProportionateScreenHeight(20),
                                        ),
                                        width: SizeConfig.screenWidth * 0.9,
                                        height: SizeConfig.screenHeight * 0.15,
                                        decoration: BoxDecoration(
                                          color: kTextColor.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/cookies.png',
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 10,
                                                horizontal:
                                                    getProportionateScreenWidth(
                                                  30,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '3123 0242 2341 2131',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          getProportionateScreenHeight(
                                                              16),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Metode Pembayaran',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          getProportionateScreenHeight(
                                                              16),
                                                      color: Colors.black87,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              getProportionateScreenHeight(10),
                                          vertical:
                                              getProportionateScreenHeight(30),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Total',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        20),
                                              ),
                                            ),
                                            Text(
                                              'Rp 30.000',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          RoundedButton(
                                            text: 'Edit Pesanan',
                                            press: () {},
                                            width:
                                                SizeConfig.screenWidth * 0.45,
                                            margin: 0,
                                            border: 10,
                                            hPadding: 5,
                                            color: Colors.white,
                                            textColor: Colors.black,
                                          ),
                                          RoundedButton(
                                            text: 'Bayar',
                                            press: () {
                                              Navigator.pushNamed(
                                                context,
                                                PaymentSuccess.routeName,
                                              );
                                            },
                                            width:
                                                SizeConfig.screenWidth * 0.45,
                                            margin: 0,
                                            border: 5,
                                            hPadding: 5,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    width: SizeConfig.screenWidth,
                    border: 10,
                    margin: 10,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Keranjang Saya',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: getProportionateScreenHeight(60),
      ),
    );
  }
}
