import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminLine extends StatelessWidget {
  const AdminLine({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return Container(
      width: screen.width,
      height: 1,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: Color.fromARGB(255, 163, 163, 163))),
    ).pOnly(top: 10, bottom: 10);
  }
}