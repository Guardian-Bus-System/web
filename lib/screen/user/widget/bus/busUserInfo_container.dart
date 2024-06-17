import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/user/pages/changeBusRoute_screen.dart';
import 'package:capstone_front/screen/user/widget/bus/busUserInfo.dart';
import 'package:capstone_front/utils/img.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class BusUserInfoConatainer extends StatefulWidget {
  late UserData user;
  final String date;
  final double containerWidth;
  final double containerHeight;

  BusUserInfoConatainer({Key? key, required this.user, required this.date, required this.containerWidth, required this.containerHeight});

  @override
  State<BusUserInfoConatainer> createState() => _BusUserInfoConatainerState();
}

class _BusUserInfoConatainerState extends State<BusUserInfoConatainer> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){
            Get.to(ChangeBusRouteScreen(data: widget.date));
            print(widget.user.loginId);
          },  
          child: Container(
            color: backgroundColor,
            height: widget.containerHeight * 0.26,
            width: widget.containerWidth,
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(children: [
                      '${widget.user.name}님, 안녕하세요!'.text.size(FontSiz18).make()]),
                    Row(children: [
                      widget.date.text.size(FontSiz12).color(baseColor).make()]),
                    height20,
                    BusUserInfo(
                      user: widget.user,
                      containerHeight: (widget.containerHeight * 0.3) * 0.5, 
                      containerWidth: widget.containerWidth
                    ),
                  ],
                ),
                //버스 이미지
                Positioned(
                  right: 0,
                  top: -20,
                  child: Image.asset(busLogo, width:170,)
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}