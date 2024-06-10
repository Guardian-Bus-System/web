import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeBusListItemWidget extends StatelessWidget {

  final busList;
  const ChangeBusListItemWidget({super.key, this.busList});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        '1호차'.text.make(),
        '칠곡IC - 동대구역'.text.make(),
        '29석'.text.make()
      ],
    ).pOnly(bottom: 21, left: 3, right: 3);
  }
}