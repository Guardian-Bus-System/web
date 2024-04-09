import 'package:capstone_front/screen/CustomSide/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70.0),
      child: AppBar(
        backgroundColor: bacgroundOrTextColor,
        title: '홈'.text.bold.size(20).make().pSymmetric(h:10),
        iconTheme: const IconThemeData(
          size: 30,
          color: Color.fromARGB(255, 45, 45, 45),
        ),
      ),
    );
  }
}
