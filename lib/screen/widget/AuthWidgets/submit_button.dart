import 'package:capstone_front/screen/widget/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/widget/CustomSide/font_size.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'input_container.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const SubmitButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return JoinContainer(
      widget: 
      ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide.none
            )
          ),
          backgroundColor: MaterialStateProperty.all<Color>(baseColor)
        ),
        onPressed: onPressed,
        child: 
          title
            .text
            .size(FontSiz15)
            .color(bacgroundOrTextColor)
            .make()
      ),
    );
  }
}