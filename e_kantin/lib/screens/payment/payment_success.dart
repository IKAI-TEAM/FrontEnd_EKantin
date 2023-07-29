import 'package:e_kantin/components/rounded_button.dart';
import 'package:e_kantin/constants.dart';
import 'package:e_kantin/size_config.dart';
import 'package:flutter/material.dart';

class PaymentSuccess extends StatelessWidget {
  static String routeName = '/paymentsuccess';
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenHeight(30)),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Image.asset('assets/images/checked1.png'),
                Padding(
                  padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(40),
                    bottom: getProportionateScreenHeight(10),
                  ),
                  child: Text(
                    'Berhasil Dipesan',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: getProportionateScreenHeight(28),
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  'Makanan diterima dan akan segera dibuat',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    color: Colors.black87,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: getProportionateScreenHeight(20),
                  ),
                  // color: Colors.amber,
                  height: SizeConfig.screenHeight * 0.12,
                  width: SizeConfig.screenWidth,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: getProportionateScreenWidth(15),
                        ),
                        height: SizeConfig.screenHeight * 0.12,
                        width: SizeConfig.screenHeight * 0.12,
                        decoration: BoxDecoration(
                          color: const Color(0xff23AA49).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenHeight(20),
                          ),
                          border: Border.all(
                            color: const Color(0xff23AA49),
                            width: 2,
                          ),
                        ),
                        child: Image.asset('assets/images/checked2.png'),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pesanan Diterima',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: getProportionateScreenHeight(20),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(3),
                          ),
                          Text(
                            'Tunggu diantarkan oleh pengirim',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: getProportionateScreenHeight(20),
                  ),
                  // color: Colors.amber,
                  height: SizeConfig.screenHeight * 0.12,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: getProportionateScreenWidth(15),
                        ),
                        height: SizeConfig.screenHeight * 0.12,
                        width: SizeConfig.screenHeight * 0.12,
                        decoration: BoxDecoration(
                          color: const Color(0xffFF9900).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenHeight(20),
                          ),
                          border: Border.all(
                            color: const Color(0xffFF9900),
                            width: 2,
                          ),
                        ),
                        child: Image.asset('assets/images/box.png'),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pesanan Diterima',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: getProportionateScreenHeight(20),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(3),
                          ),
                          Flexible(
                            child: Text(
                              'Penjual menyiapkan pesanan\ndan akan segera dikirim.',
                              softWrap: true,
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: SizeConfig.screenHeight * 0.18,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RoundedButton(
              margin: 0,
              vPadding: getProportionateScreenHeight(18),
              text: 'Lihat Pesanan',
              press: () {},
              width: SizeConfig.screenWidth * 0.9,
              border: 5,
            ),
            RoundedButton(
              margin: getProportionateScreenHeight(10),
              vPadding: getProportionateScreenHeight(15),
              text: 'Kembali Ke Beranda',
              press: () {},
              width: SizeConfig.screenWidth * 0.9,
              border: 5,
              color: Colors.white,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
