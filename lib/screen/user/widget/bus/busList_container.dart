import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/user/widget/bus/busListItem_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class BusListContainer extends StatefulWidget {
  final double listItemWidth;
  final double listItemHeight;

  const BusListContainer({super.key, required this.listItemWidth, required this.listItemHeight});

  @override
  State<BusListContainer> createState() => _BusListContainerState();
}

class _BusListContainerState extends State<BusListContainer> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          '버스목록'.text.size(FontSiz18).make().pOnly(left: 15)]),
        height15,
        SizedBox(
          width: widget.listItemWidth,
          child: ListView.builder(  
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) {
              return BusListItemWidget(
                listItemHeight: 70,
                listItemWidth: widget.listItemWidth,
              );
            },
          ),
        ),
      ],
    ).pOnly(left: 10);
  }
}