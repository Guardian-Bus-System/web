import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:velocity_x/velocity_x.dart';

class BusTakeButtonWidget extends StatefulWidget {
  final String buttonText;

  const BusTakeButtonWidget({super.key, required this.buttonText});

  @override
  State<BusTakeButtonWidget> createState() => _BusTakeButtonWidgetState();
}

class _BusTakeButtonWidgetState extends State<BusTakeButtonWidget> {
  RxBool isClicked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          print('asdad');
          isClicked.value = !isClicked.value; 
        },
        child: Container(
          width: 80, height: 35,
          decoration: BoxDecoration(
            color: isClicked.value ?  baseColor : backgroundColor,
            border: Border.all(width: 1, color: baseColor),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Center(
            child: widget.buttonText.text
              .color(isClicked.value ? white : baseColor)
              .size(FontSiz14)
              .fontWeight(isClicked.value ? FontWeight.normal : FontWeight.bold) // 조건에 따라 글씨 두께 변경
              .make()
          ),
        ),
      ),
    );
  }
}