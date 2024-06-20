import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/user/widget/bus/busList_container.dart';
import 'package:capstone_front/screen/user/widget/bus/busUserInfo_container.dart';
import 'package:capstone_front/screen/user/widget/customHomeAppbarWidget.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/formatter.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/scrolling_text.dart';
import 'package:capstone_front/screen/user/widget/drawer_widget.dart';
import 'package:capstone_front/screen/user/widget/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../controller/userController/user_controller.dart';
import '../auth/login_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();  
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  UserController userController = UserController();
  late Rx<UserData> userdata = 
    UserData(
      id: '',pw: '', loginId: 'loginId',
      grade: 1, classNumber: 1, number: 0,  
      name: '홍길동', 
      roles: [], authorities: [], 
      timestamp: ''
    ).obs; // userdata를 Rx 형태로 선언

  var tokens = 'No Token'.obs; 
  String date = '';

  @override
  void initState() {
    
    print(userdata.value.loginId);

    super.initState();
    //_init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //URL 처리 플러그인 찾기

  // Future<void> _init() async {
  //   FlutterLocalNotification.init();
  //   await FlutterLocalNotification.requestNotificationPermission();
  //   date = getFormattedDateTime();
  //   await _checkToken();
  // }

  // Future<void> _checkToken() async {
  //   final SharedPreferences prefs = await _prefs; 
  //   final String? token = prefs.getString('token');
  //   if (token != null) {
  //     tokens.value = token; 
  //     userdata.value = await userController.getUserData();
  //   } else {
  //     Get.offAll(LoginPage()); 
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        endDrawer: DrawerWidget(user: userdata,),
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
                        height20,
                        height5,
                        BusUserInfoConatainer(
                          user: userdata.value,
                          date: date,
                          containerHeight: screen.height,
                          containerWidth: screen.width - 50,
                        ),
                        BusListContainer(
                          listItemHeight: screen.height,
                          listItemWidth: screen.width - 50,
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