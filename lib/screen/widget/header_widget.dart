import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderWidget extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;

  const HeaderWidget({super.key, required this.title, required this.onPressed});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.title.text.bold.xl2.black.make(),
        IconButton(
          onPressed: widget.onPressed, 
          icon: Icon(Icons.add), iconSize: 30, color: adminNavigationColor)
      ],
    ).pOnly(bottom: 10);
  }
}