import 'package:e_kantin/constants.dart';
import 'package:e_kantin/screens/home/components/banner_button.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> specialOffer = [
      {
        "text1": "Ramadhan Offers",
        "text2": "25% Off",
        "image": "assets/images/tes.jpg"
      },
      {
        "text1": "Lebaran Offers",
        "text2": "50% Off",
        "image": "assets/images/tes.jpg"
      },
      {
        "text1": "Winter Sale",
        "text2": "10% Off",
        "image": "assets/images/tes.jpg"
      },
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
              specialOffer.length,
              (index) => SpecialOfferCard(
                text1: specialOffer[index]["text1"],
                text2: specialOffer[index]["text2"],
                image: specialOffer[index]["image"],
                press: () {},
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(20),
            )
          ],
        ),
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.text1,
    required this.text2,
    required this.image,
    required this.press,
  });
  final String text1, text2, image;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(320),
        height: getProportionateScreenHeight(150),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(20),
                      horizontal: getProportionateScreenWidth(20),
                    ),
                    width: getProportionateScreenWidth(320) * 0.55,
                    height: getProportionateScreenHeight(150),
                    decoration: BoxDecoration(
                      color: kMainColor.withOpacity(1),
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.elliptical(15, 80),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          text1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(14),
                          ),
                        ),
                        Text(
                          text2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(32),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        BannerButton(
                          width: getProportionateScreenWidth(320) * 0.35,
                          press: press,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
