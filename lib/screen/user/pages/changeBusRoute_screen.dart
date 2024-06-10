import 'package:capstone_front/screen/user/pages/home_screen.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/submit_button.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/input_Field.dart';
import 'package:capstone_front/screen/user/widget/bus/busRouteChange_container.dart';
import 'package:capstone_front/screen/user/widget/bus/busTakeButtonWidget.dart';
import 'package:capstone_front/screen/user/widget/bus/changeBusListItem_widget.dart';
import 'package:capstone_front/screen/user/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeBusRouteScreen extends StatefulWidget {
  final data;
  const ChangeBusRouteScreen({super.key, required this.data});

  @override
  State<ChangeBusRouteScreen> createState() => _ChangeBusRouteScreenState();
}

class _ChangeBusRouteScreenState extends State<ChangeBusRouteScreen> {
  TextEditingController textEditingController = TextEditingController();

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
              child: Column(
                children: [
                  height20,
                  ListView.builder(  
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ChangeBusListItemWidget();
                    },
                  ),
                ],
              ),
            ),  
            height10,
            BusRouteChangeContainer(
              containerName: '변경 사유',
              child: Column(
                children: [
                  height15,
                  InputTextFieldWidget(
                    textEditingController: textEditingController, 
                    hitText: '변경사유를 입력해 주세요.\n(사유가 타당하지 않을 경우 경로 변경이 불가합니다.', 
                    blindetext: false
                  ),
                ],
              ),
            ),
            height10,
            SubmitButton(
              onPressed: () {
                Get.offAll(HomeScreen());
              }, 
              title: '신청하기'
            ).pOnly(bottom: 25)
          ],
        ).pSymmetric(h: 25),
      ),
    );
  }
}