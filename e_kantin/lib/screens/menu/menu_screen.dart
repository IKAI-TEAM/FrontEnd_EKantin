import 'package:e_kantin/constants.dart';
import 'package:e_kantin/models/product.dart';
import 'package:e_kantin/screens/home/components/product_card.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  static String routeName = '/menu';
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          child: Text(
            textAlign: TextAlign.center,
            "Best Seller",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        toolbarHeight: SizeConfig.screenHeight * 0.08,
        iconTheme: const IconThemeData(color: kButtonColor),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProductCard(
                      product: demoProduct[0],
                    ),
                    ProductCard(
                      product: demoProduct[1],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProductCard(
                      product: demoProduct[2],
                    ),
                    ProductCard(
                      product: demoProduct[0],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProductCard(
                      product: demoProduct[1],
                    ),
                    ProductCard(
                      product: demoProduct[2],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProductCard(
                      product: demoProduct[0],
                    ),
                    ProductCard(
                      product: demoProduct[1],
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
