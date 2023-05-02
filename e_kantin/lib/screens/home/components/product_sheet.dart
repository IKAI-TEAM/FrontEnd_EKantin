import 'package:e_kantin/components/rounded_button.dart';
import 'package:e_kantin/constants.dart';
import 'package:e_kantin/models/product.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';

class ProductSheet extends StatefulWidget {
  const ProductSheet({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<ProductSheet> createState() => _ProductSheetState();
}

class _ProductSheetState extends State<ProductSheet> {
  int itemCount = 1;
  int total = 0;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.62,
      initialChildSize: 0.6,
      minChildSize: 0.5,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -getProportionateScreenHeight(10),
                child: Container(
                  width: getProportionateScreenWidth(60),
                  height: getProportionateScreenHeight(5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenWidth * 0.08,
                  ),
                  Container(
                    width: SizeConfig.screenWidth * 0.85,
                    height: SizeConfig.screenWidth * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                      color: kSecondaryColor,
                      image: DecorationImage(
                        image: AssetImage(widget.product.images[0]),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(15),
                      horizontal: getProportionateScreenWidth(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenHeight(20),
                            ),
                            children: [
                              TextSpan(text: "${widget.product.title}\n"),
                              TextSpan(
                                text: widget.product.description,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: kTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.32,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenHeight(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: getProportionateScreenHeight(35),
                                  width: getProportionateScreenHeight(35),
                                  decoration: BoxDecoration(
                                    color: itemCount != 0
                                        ? kSecondaryColor
                                        : kTextColor.withOpacity(0.6),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        getProportionateScreenHeight(8),
                                      ),
                                    ),
                                  ),
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    color: kMainColor,
                                    disabledColor: Colors.black,
                                    onPressed: itemCount != 0
                                        ? () {
                                            setState(() {
                                              itemCount--;
                                              total = itemCount *
                                                  widget.product.price;
                                            });
                                          }
                                        : null,
                                    icon: const Icon(Icons.remove_rounded),
                                  ),
                                ),
                                Text(
                                  itemCount.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenHeight(24),
                                  ),
                                ),
                                Container(
                                  height: getProportionateScreenHeight(35),
                                  width: getProportionateScreenHeight(35),
                                  decoration: BoxDecoration(
                                    color: kMainColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        getProportionateScreenHeight(8),
                                      ),
                                    ),
                                  ),
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    color: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        itemCount++;
                                        total =
                                            itemCount * widget.product.price;
                                      });
                                    },
                                    icon: const Icon(Icons.add_rounded),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: getProportionateScreenHeight(25),
                          width: getProportionateScreenHeight(25),
                          decoration: BoxDecoration(
                            color: kMainColor.withOpacity(0.2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                getProportionateScreenHeight(8),
                              ),
                            ),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_rounded,
                              color: kMainColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: getProportionateScreenHeight(10),
                          ),
                          child: Text(
                            "Tambahan",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: getProportionateScreenHeight(16),
                                color: kTextColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RoundedButton(
                      text:
                          "Masukkan Keranjang - Rp. ${total != 0 ? total : widget.product.price}",
                      press: () {},
                      width: SizeConfig.screenWidth * 0.9)
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
