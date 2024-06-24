import 'package:capstone_front/controller/userController/busInfo_controller.dart';
import 'package:capstone_front/model/BusModel.dart';
import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/screen/user/auth/change_pw_page.dart';
import 'package:capstone_front/screen/user/auth/login_page.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/formatter.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/user/widget/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widget/custom_appbar.dart';

class ProfileScreen extends StatefulWidget {
  final Rx<UserData> user;

  ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  BusInfoController busInfoController = Get.put(BusInfoController());
  
  late Rx<BusData> busData = BusData(
    id: 0, busNumber: 0, 
    line: 'dasd', endLine: 'asd', 
    maxTable: 0, 
    createdAt: 'createdAt', updateAt: 'updateAt', 
    timestamp: ''
  ).obs;

  @override
  void initState() {
    //_init();
    super.initState();
  }
  Future<void> _init() async {
    FlutterLocalNotification.init();
    await FlutterLocalNotification.requestNotificationPermission();
    await _checkToken();
  }

  Future<void> _checkToken() async {
    final SharedPreferences prefs = await _prefs; 
    final String? token = prefs.getString('token');
    if (token != null) {
      BusData busData = await busInfoController.getBusData();
      print(busData.busNumber);
    } else {
      Get.to(LoginPage()); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(73.0),
        child: Column(
          children: [
            CustomAppBar(
              appBarTitle: '내 프로필',
            ),Divider(),
          ],
        ),
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height30,
                '안녕하세요'.text.bold.size(FontSiz18).make(),
                Row(
                  children: [
                    '학생 '.text.bold.size(FontSiz18).color(baseColor).make(),
                    '${widget.user.value.name}님'.text.bold.size(FontSiz18).make()
                  ],
                ),
                height15,
                'x월 x일 예정 도착지 - 동대구역'.text.bold.size(FontSiz15).color(baseColor).make(),
                height30,
              ],
            ).pOnly(left: 25),
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    '내 정보'.text.bold.size(FontSiz18).make(),
                    InkWell(
                      onTap: (){
                        Get.to(ChangePwPage(userName: widget.user.value.name));
                      },
                      child: '비밀번호 변경'.text.color(baseColor).size(FontSiz11).make()
                    ),
                  ],
                ),
                const SizedBox(height: 17),
                Row(
                  children: [
                    '이름'.text.color(greyText).make(),
                    width40,
                    widget.user.value.name.text.bold.make()
                  ],
                ),
                height15,
                Row(
                  children: [
                    '학번'.text.color(greyText).make(),
                    width40,
                    '${widget.user.value.gradeClass}${
                        widget.user.value.number}번'
                        .text.bold.make()
                  ],
                ),
                height15,
                Row(
                  children: [
                    '아이디'.text.color(greyText).make(),
                    width40,
                    widget.user.value.loginId.text.bold.make()
                  ],
                ),
              ],
            ).pOnly(left: 25, right: 25),
            const SizedBox(height: 17),
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height15,
                '버스 탑승 정보'.text.bold.size(FontSiz18).make(),
                const SizedBox(height: 17),
                Row(
                  children: [
                    '이름'.text.color(greyText).make(),
                    width40,
                    widget.user.value.name.text.bold.make()
                  ],
                ),
                height15,
                Row(
                  children: [
                    '버스 경로'.text.color(greyText).make(),
                    width40,
                    '${widget.user.value.gradeClass}${
                        widget.user.value.number}번'
                        .text.bold.make()
                  ],
                ),
                height15,
                Row(
                  children: [
                    '하차 역'.text.color(greyText).make(),
                    width40,
                    widget.user.value.loginId.text.bold.make()
                  ],
                ),
              ],
            ).pOnly(left: 25, right: 25),
          ],
        ),
      ),
    );
  }
}
