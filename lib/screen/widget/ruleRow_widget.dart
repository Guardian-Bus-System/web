import 'package:capstone_front/screen/widget/CustomSide/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

import 'CustomSide/spaceing_box.dart';

class RuleRowWidget extends StatelessWidget {
  final int number;
  final String ruleText;

  const RuleRowWidget({Key? key, required this.number, required this.ruleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            '$number. '.text.size(FontSiz14).make(),
            Expanded(
              child: Text(
                ruleText,
                style: const TextStyle(fontSize: FontSiz14),
                softWrap: true,
              ),
            ),
          ],
        ),
        height10
      ],
    ).pOnly(right: 25);
  }
}
