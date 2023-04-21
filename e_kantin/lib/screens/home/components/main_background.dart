import 'package:flutter/material.dart';
import '../../../size_config.dart';

class MainBackground extends StatelessWidget {
  final Widget child;
  const MainBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      // physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: SizeConfig.screenHeight,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Image.asset(
                'assets/images/main_top.png',
                width: SizeConfig.screenWidth,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
