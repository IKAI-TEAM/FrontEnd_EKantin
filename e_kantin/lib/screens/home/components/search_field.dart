import 'package:e_kantin/constants.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenHeight(15),
        vertical: getProportionateScreenHeight(20),
      ),
      decoration: BoxDecoration(
        color: kTextColor.withOpacity(0.2),
        border: Border.all(color: kTextColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search Category",
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
            ),
            child: const Icon(Icons.search),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 0,
          ),
        ),
      ),
    );
  }
}
