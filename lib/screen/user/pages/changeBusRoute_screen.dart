import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/model/data.dart';
import 'package:capstone_front/screen/user/pages/home_screen.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/submit_button.dart';
import 'package:capstone_front/screen/user/widget/bus/busDropdownButton_widget.dart';
import 'package:capstone_front/screen/user/widget/bus/busLoadCheckButtonWidget.dart';
import 'package:capstone_front/screen/user/widget/bus/busRouteChange_container.dart';
import 'package:capstone_front/screen/user/widget/bus/busTakeButtonWidget.dart';
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
  final GlobalKey<BusDropDownButtonWidgetState> _dropDownKey = GlobalKey<BusDropDownButtonWidgetState>();

  var _selectedButtonIndex = 0.obs; // 현재 선택된 버튼의 인덱스

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
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
              shadowBool: true,
              child: Column(
                children: [
                  height15,
                  Row(
                    children: [
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
              containerName: '도착 지역 선택',
              shadowBool: true,
              child: Column(
                children: [
                  height15,
                  Obx(() => 
                    Row(
                      children: [
                        Column(
                          children: categories.asMap().entries.map((entry) {
                            int index = entry.key;
                            var category = entry.value;
                            return BusLoadCheckButtonWidget(
                              title: category['name'] as String,
                              items: category['items'] as List<String>,
                              dropDownKey: _dropDownKey,
                              isSelected: _selectedButtonIndex.value == index, // 버튼이 선택되었는지 여부
                              onTap: () {
                                _selectedButtonIndex.value = index; // 현재 선택된 버튼 인덱스를 업데이트
                              },
                            ).pOnly(bottom: 10); // 버튼 간의 간격을 추가
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  height15,
                  BusRouteChangeContainer(
                    containerName: '하차 지역 선택',
                    shadowBool: false,
                    child: Column(
                      children: [
                        height15,
                        BusDropDownButtonWidget(key: _dropDownKey)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            height30,
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