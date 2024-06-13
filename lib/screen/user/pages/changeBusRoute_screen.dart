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
      appBar:const PreferredSize(
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
              containerName: '도착 지역 선택',
              shadowBool: true,
              child: Column(
                children: [
                  height15,
                  ListView.builder(  
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ChangeBusListItemWidget();
                    },
                  ),
                  BusRouteChangeContainer(
                    containerName: '도착 지역 선택',
                    shadowBool: false,
                    child: Column(
                      children: [
                        height15,
                        DropDownExample()
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

class DropDownExample extends StatefulWidget {
  @override
  _DropDownExampleState createState() => _DropDownExampleState();
}

class _DropDownExampleState extends State<DropDownExample> {
  // 드롭다운 버튼 항목 리스트
  List<String> dropdownItems = ['Select an item'];

  // 선택된 드롭다운 항목
  String? selectedItem = 'Select an item';

  // 버튼 클릭 시 드롭다운 항목 목록을 변경하는 함수
  void _updateDropdownItems(List<String> items) {
    setState(() {
      dropdownItems = items;
      selectedItem = items.isNotEmpty ? items[0] : null; // 첫 번째 항목을 기본 선택
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 수평 스크롤 가능하도록 버튼 리스트를 생성
        SizedBox(
          height: 50, // 고정 높이 지정
          child: ListView(
            scrollDirection: Axis.horizontal, // 수평 스크롤
            children: [
              _buildTextButton('Fruits', ['Apple', 'Banana', 'Cherry']),
              _buildTextButton('Vegetables', ['Carrot', 'Broccoli', 'Peas']),
              _buildTextButton('Animals', ['Dog', 'Cat', 'Bird']),
            ],
          ),
        ),
        SizedBox(height: 20),
        // 드롭다운 버튼
        DropdownButton<String>(
          value: selectedItem,
          onChanged: (String? newValue) {
            setState(() {
              selectedItem = newValue;
            });
          },
          items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  // 버튼을 생성하는 함수
  Widget _buildTextButton(String label, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () => _updateDropdownItems(items),
        style: TextButton.styleFrom(
          backgroundColor: Colors.blueAccent.withOpacity(0.1),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
