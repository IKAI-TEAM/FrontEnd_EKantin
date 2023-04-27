import 'package:e_kantin/models/product.dart';
import 'package:e_kantin/screens/home/components/product_card.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
              demoProduct.length,
              (index) => ProductCard(
                product: demoProduct[index],
                paddingLeft: getProportionateScreenWidth(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
