import 'package:e_kantin/components/rounded_button.dart';
import 'package:e_kantin/constants.dart';
import 'package:e_kantin/models/product.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';

class AddOnSheet extends StatefulWidget {
  const AddOnSheet({
    super.key,
    required this.product,
    required this.hargaTambahan,
  });

  final Product product;
  final ValueSetter hargaTambahan;
  @override
  State<AddOnSheet> createState() => _AddOnSheetState();
}

class _AddOnSheetState extends State<AddOnSheet> {
  // bool? checkedValue = false;
  late List<bool?> checkedValue = List.generate(
    widget.product.addons.length,
    (index) => false,
  );

  late List<String> addonsList = widget.product.addons.keys.toList();
  late List<int> addonsPrice = widget.product.addons.values.toList();
  late List<num> price = List.generate(
    widget.product.addons.length,
    (index) => 0,
  );

  num totalPrice = 0;

  void _onCheckboxChange(bool? newValue, index) {
    setState(() {
      checkedValue[index] = newValue;

      price = List.generate(
        checkedValue.length,
        (index) {
          if (checkedValue[index]!) {
            return addonsPrice[index];
          } else {
            return 0;
          }
        },
      );

      totalPrice = price.fold(0, (p, c) => p + c);
      widget.hargaTambahan(totalPrice);
    });
  }

  void _getAddonPrice() {
    checkedValue.map((e) {
      if (e!) {
        price.add;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      minChildSize: 0.5,
      maxChildSize: 0.7,
      initialChildSize: 0.6,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(30)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(20),
                  ),
                  child: Text(
                    "Tambahan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(22),
                    ),
                  ),
                ),
                ...List.generate(
                  widget.product.addons.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      bottom: getProportionateScreenHeight(10),
                    ),
                    child: CheckboxListTile(
                      title: Text(addonsList[index]),
                      subtitle: Text(addonsPrice[index].toString()),
                      value: checkedValue[index],
                      onChanged: (value) {
                        setState(() {
                          _onCheckboxChange(value, index);
                        });
                      },
                      tileColor: kSecondaryColor,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: kMainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenHeight(15),
                        ),
                      ),
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Text("Catatan"),
                  ],
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Catatan", border: OutlineInputBorder()),
                ),
                RoundedButton(
                  text: "Add Addon - $totalPrice",
                  press: () {
                    Navigator.pop(context);
                  },
                  width: SizeConfig.screenWidth,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
