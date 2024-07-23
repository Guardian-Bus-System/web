import 'package:capstone_front/controller/userController/busInfo_controller.dart';
import 'package:capstone_front/controller/userController/user_controller.dart';
import 'package:capstone_front/model/ReservationModel.dart';
import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/model/data.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/formatter.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/user/widget/custom_appbar.dart';
import 'package:capstone_front/screen/user/widget/loadingAction.dart';
import 'package:capstone_front/screen/user/widget/profileRow_Widget.dart';
import 'package:capstone_front/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserController userController = Get.put(UserController());
  UserBusInfoController userBusInfoController = Get.put(UserBusInfoController());

  Rx<User> userdata = USERDATA;
  late RxList<ReservationData> busInfo = <ReservationData>[].obs;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    if (await checkTokens()) {
      UserResponse userResponse = await userController.getUserData();
      userdata.value = userResponse.data;

      ReservationResponse reservationData = await userBusInfoController.getUserBusInfo();
      if (reservationData.data != null) {
        busInfo.value = [reservationData.data!];
      }
    }
  }

  @override
  void dispose() {
    Get.delete<UserController>();
    Get.delete<UserBusInfoController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(73.0),
        child: Column(
          children: [
            CustomAppBar(appBarTitle: '내 프로필'),
            Divider(),
          ],
        ),
      ),
      body: Obx(() {
        if (busInfo.isEmpty) {
          return const LoadingProgressIndecatorWidget();
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  '안녕하세요'.text.bold.size(FontSiz18).make(),
                  Row(
                    children: [
                      '학생 '.text.bold.size(FontSiz18).color(baseColor).make(),
                      '${userdata.value.name}님'.text.bold.size(FontSiz18).make()
                    ],
                  ),
                  height15,
                  // Check if busInfo is not empty before displaying data
                  if (busInfo.isNotEmpty)
                    '${getNextFridayDateFormatted()}예정 - 도착지 - ${busInfo[0].endCity}'.text.bold.size(FontSiz15).color(baseColor).make(),
                  height30,
                ],
              ).pOnly(left: 25, top: 30),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileRowTopWidget(
                    leftTitle: '내 정보', 
                    rightTitle: '비밀번호 변경', 
                    rightTitleColor: baseColor, 
                    toNamedRoute: '/cerfication'
                  ),
                  ProfileRowSideWidget(
                    title: '호차', 
                    content: userdata.value.name
                  ),
                  ProfileRowSideWidget(
                    title: '학번', 
                    content: '${userdata.value.gradeClass}${userdata.value.number}번'
                  ),
                  ProfileRowSideWidget(
                    title: '아이디', 
                    content: userdata.value.loginId
                  )
                ],
              ).pSymmetric(h: 25),
              const SizedBox(height: 17),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileRowTopWidget(
                    leftTitle: '버스 탑승 정보', 
                    rightTitle: '예약 수정',
                    rightTitleColor: Colors.red, 
                    toNamedRoute: '/changePushRoute'
                  ),
                  // Check if busInfo is not empty before displaying data
                  if (busInfo.isNotEmpty) ...[
                    ProfileRowSideWidget(
                      title: '호차', 
                      content: '${busInfo[0].busInfo.busNumber}호차'
                    ),
                    ProfileRowSideWidget(
                      title: '버스 경로', 
                      content: '${busInfo[0].busInfo.busName} - ${
                                busInfo[0].busInfo.towns.map((town) => town.townName).join(' - ')}'
                    ),
                    ProfileRowSideWidget(
                      title: '하차 역', 
                      content: '${busInfo[0].endCity}호차'
                    ),
                  ] else
                    '버스 탑승 정보가 없습니다.'.text.make(),
                ],
              ).pSymmetric(h: 25),
            ],
          ),
        );
      })
    );
  }
}
