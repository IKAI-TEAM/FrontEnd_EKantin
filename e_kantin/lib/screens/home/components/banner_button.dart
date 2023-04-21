import 'package:e_kantin/constants.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';

class BannerButton extends StatelessWidget {
  final double width;
  final void Function() press;

  const BannerButton({super.key, required this.width, required this.press});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: getProportionateScreenHeight(35),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(60)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(5),
              horizontal: getProportionateScreenWidth(5),
            ),
            backgroundColor: Colors.white,
          ),
          onPressed: press,
          child: Text(
            "Grab Offer",
            style: TextStyle(
              color: kMainColor,
              fontSize: getProportionateScreenWidth(14),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
