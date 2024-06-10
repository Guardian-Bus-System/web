import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BusTakeButtonWidget extends StatefulWidget {
  final String buttonText;

  const BusTakeButtonWidget({super.key, required this.buttonText});

  @override
  State<BusTakeButtonWidget> createState() => _BusTakeButtonWidgetState();
}

class _BusTakeButtonWidgetState extends State<BusTakeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('asdad');
      },
      child: Container(
        width: 80, height: 35,
        decoration: BoxDecoration(
          color: widget.buttonText == "탑승" ? baseColor : backgroundColor,
          border: Border.all(width: 1, color: baseColor),
          borderRadius: BorderRadius.circular(10) 
        ),
        child: Center(
          child: widget.buttonText
                  .text
                  .color(widget.buttonText != "탑승" ? baseColor : white)
                  .size(FontSiz14).make()
        )
      ),
    );
  }
}