import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  static String routeName = "/activity";
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Activity"),
      ),
    );
  }
}
