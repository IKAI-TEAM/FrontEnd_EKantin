import 'package:e_kantin/constants.dart';
import 'package:e_kantin/models/product.dart';
import 'package:e_kantin/screens/home/components/product_sheet.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.width = 150,
    this.aspectRatio = 1.02,
    this.paddingLeft = 0,
  });

  final Product product;
  final double width, aspectRatio, paddingLeft;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                padding: EdgeInsets.all(
                  getProportionateScreenWidth(20),
                ),
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  product.images[0],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: getProportionateScreenHeight(8),
                      left: getProportionateScreenWidth(5)),
                  child: Text(
                    product.title,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(5)),
                  child: Text(
                    "Rp. ${product.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffff324B),
                    ),
                  ),
                ),
                Container(
                  width: getProportionateScreenWidth(28),
                  height: getProportionateScreenWidth(28),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.99),
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox(
                    child: IconButton(
                      color: kMainColor,
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                          ),
                          builder: (BuildContext context) {
                            return ProductSheet(
                              product: product,
                            );
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     // top: getProportionateScreenHeight(10),
            //     bottom: getProportionateScreenHeight(5),
            //   ),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text.rich(
            //       TextSpan(
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: getProportionateScreenWidth(14),
            //         ),
            //         children: [
            //           TextSpan(text: "${product.title}\n"),
            //           TextSpan(
            //             text: "Rp. ${product.price}",
            //             style: const TextStyle(
            //               color: Color(0xffff324B),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
