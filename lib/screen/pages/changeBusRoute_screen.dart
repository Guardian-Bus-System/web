import 'package:capstone_front/screen/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/CustomSide/font_size.dart';
import 'package:capstone_front/screen/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/widget/bus/busRouteChange_container.dart';
import 'package:capstone_front/screen/widget/bus/busTakeButtonWidget.dart';
import 'package:capstone_front/screen/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeBusRouteScreen extends StatefulWidget {
  final data;

  const ChangeBusRouteScreen({super.key, required this.data});

  @override
  State<ChangeBusRouteScreen> createState() => _ChangeBusRouteScreenState();
}

class _ChangeBusRouteScreenState extends State<ChangeBusRouteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CustomAppBar(
          appBarTitle: '버스 경로 변경',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            '버스 경로 변경'.text.bold.size(FontSiz18).make(),
            height5,
            '금주 귀가주 (${widget.data})버스 정보'.text.size(FontSiz12).color(baseColor).make(),
            height15,
            BusRouteChangeContainer(
              containerName: '버스 탑승 여부',
              child: Column(
                children: [
                  height15,
                  Row(children: [
                      BusTakeButtonWidget(buttonText: '탑승',),
                      width20,
                      BusTakeButtonWidget(buttonText: '미탑승',), 
                    ],
                  ),
                ],
              )
            ),
            height10,
            BusRouteChangeContainer(
              containerName: '탑승 버스 선택',
              child: Container(),
            ),
            height10,
            BusRouteChangeContainer(
              containerName: '변경 사유',
              child: Container(),
            ),
          ],
        ).pSymmetric(h: 25),
      ),
    );
  }
}