import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BusUserInfo extends StatefulWidget {
  late UserData user;
  final double containerWidth;
  final double containerHeight;

  BusUserInfo({super.key, required this.user, required this.containerWidth, required this.containerHeight});

  @override
  State<BusUserInfo> createState() => _BusUserInfoState();
}

class _BusUserInfoState extends State<BusUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.containerHeight,
      width: widget.containerWidth,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 0,
            blurRadius: 7.0,
            offset: Offset(0, 6),
          ),],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  '${widget.user.grade
                  }${widget.user.classNumber
                  }${widget.user.number > 9 
                    ? widget.user.number 
                    : '0${widget.user.number}'} ${widget.user.name}'
                    .text.bold
                    .size(FontSiz18)
                    .color(bacgroundOrTextColor).make(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  '1'.text
                    .color(bacgroundOrTextColor)
                    .size(FontSiz12 * 4)
                    .make(),

                  '호차'.text
                    .size(FontSiz18)
                    .color(bacgroundOrTextColor)
                    .make().pOnly(top:15),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      '대구북부정류장 - 동대구역'.text.size(FontSiz15).color(bacgroundOrTextColor).make(),
                      '동대구역 하차'.text.size(FontSiz13).color(bacgroundOrTextColor).make(),
                    ],
                  ).pOnly(left: 55)
                ],
              ),
            ],
          )
        ],
      ).pOnly(left: 15, right: 15, top: 10),
    );
  }
}