import 'package:flutter/material.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:velocity_x/velocity_x.dart';

class BusTakeButtonWidget extends StatelessWidget {
  final String buttonText;
  final bool isSelected;
  final VoidCallback onTap;

  const BusTakeButtonWidget({
    Key? key,
    required this.buttonText,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 35,
        decoration: BoxDecoration(
          color: isSelected ? baseColor : backgroundColor,
          border: Border.all(width: 1, color: baseColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: buttonText.text
              .color(isSelected ? Colors.white : baseColor)
              .size(FontSiz14)
              .fontWeight(isSelected ? FontWeight.normal : FontWeight.bold)
              .make(),
        ),
      ),
    );
  }
}
