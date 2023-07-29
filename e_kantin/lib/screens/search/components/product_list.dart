import 'package:e_kantin/constants.dart';
import 'package:e_kantin/models/product.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';

class ProductInSearch extends StatelessWidget {
  const ProductInSearch({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: getProportionateScreenHeight(15),
      ),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenWidth * 0.3,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(
              getProportionateScreenHeight(10),
            ),
            height: SizeConfig.screenWidth * 0.3,
            width: SizeConfig.screenWidth * 0.33,
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image(
              image: AssetImage(product.images[0]),
            ),
          ),
          SizedBox(
            width: getProportionateScreenHeight(20),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${product.title}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: getProportionateScreenHeight(20),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(15),
                ),
                child: Text(
                  'Rp ${product.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenHeight(18),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
