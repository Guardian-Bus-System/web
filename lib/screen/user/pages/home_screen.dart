import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/user/auth/login_page.dart';
import 'package:capstone_front/screen/user/widget/bus/busList_container.dart';
import 'package:capstone_front/screen/user/widget/bus/busUserInfo_container.dart';
import 'package:capstone_front/screen/user/widget/customHomeAppbarWidget.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/scrolling_text.dart';
import 'package:capstone_front/screen/user/widget/drawer_widget.dart';
import 'package:capstone_front/screen/user/widget/notification/notification.dart';
import 'package:capstone_front/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/userController/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();  

  UserController userController = UserController();
   late Rx<UserData> userdata = 
    UserData(
      id: '',pw: '', loginId: 'loginId', name: '홍길동', gradeClass: "0학년 0반", number: 0,phoneNumber: '010-////-////',  
      roles: [], authorities: [], timestamp: ''
    ).obs; // userdata를 Rx 형태로 선언

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _init() async {
    FlutterLocalNotification.init();
    await FlutterLocalNotification.requestNotificationPermission();
    await _getData();
  }

  Future<void> _getData() async {
    if (await checkTokens()) {
      userdata.value = await userController.getUserData();
    } else {
      Get.to(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        endDrawer: DrawerWidget(user: userdata),
        body: Container(
          color: backgroundColor,
          child: Center(
            child: Column(
              children: [
                CustonHomeAppbarWidget(scaffoldKey: _scaffoldKey),
                const Divider(), height10,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed('/notification');
                            FlutterLocalNotification.showNotification();
                          },
                          child: const ScrollingTextWidget(
                            moveText: '움직이는 공지 텍스트 입니다. 길이가 길어지면 그만큼 속도가 조절 됩니다.'
                          ),
                        ),
                        height25,
                        BusUserInfoContainer(
                          containerWidth: screen.width - 50, containerHeight: screen.height,
                          user: userdata.value,
                        ),
                        BusListContainer(
                          listItemWidth: screen.width - 50, listItemHeight: screen.height,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}