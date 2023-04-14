import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_left.png",
                width: size.width * 0.8,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/main_right.png",
                width: size.height * 0.4,
              ),
            ),
            Positioned(
              bottom: 0,
              right: -25,
              child: Image.asset(
                "assets/images/splash_icon.png",
                width: size.width * 1.3,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
