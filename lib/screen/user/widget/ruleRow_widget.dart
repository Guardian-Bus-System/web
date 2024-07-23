import 'package:capstone_front/CustomSide/font_size.dart';
<<<<<<< HEAD
import 'package:capstone_front/CustomSide/spaceing_box.dart';
=======
>>>>>>> 896976be7360d68254617b082fdb27152952e764
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

<<<<<<< HEAD
=======
import '../../../CustomSide/spaceing_box.dart';

>>>>>>> 896976be7360d68254617b082fdb27152952e764
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
