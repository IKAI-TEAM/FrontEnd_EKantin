import 'package:e_kantin/constants.dart';
import 'package:e_kantin/screens/cart/cart.dart';
import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  const Fab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () {
        Navigator.pushNamed(context, CartScreen.routeName);
      },
      backgroundColor: kMainColor,
      child: const Icon(Icons.shopping_cart_outlined),
    );
  }
}
