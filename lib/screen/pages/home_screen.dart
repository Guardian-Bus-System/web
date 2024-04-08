import 'package:capstone_front/screen/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/CustomSide/font_size.dart';
import 'package:capstone_front/screen/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/auth/authPages/login_page.dart';
import 'package:capstone_front/screen/auth/widgets/drawer_widget.dart';
import 'package:capstone_front/screen/auth/widgets/formatter.dart';
import 'package:capstone_front/screen/auth/widgets/scrolling_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var tokens = 'No Token'.obs; 
  String date = '';

  @override
  void initState() {
    date = getFormattedDateTime();
    super.initState();
    // initState에서 토큰을 미리 확인
    //_checkToken();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 토큰 확인 함수
  // Future<void> _checkToken() async {
  //   final SharedPreferences prefs = await _prefs;
  //   final String? token = prefs.getString('token');
  //   if (token != null) {
  //     tokens.value = token; // 토큰이 있는 경우 업데이트
  //   } else {
  //     print("Login Plz");
  //     Get.offAll(LoginPage()); // 토큰이 없는 경우 로그인 화면으로 이동
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width - 50;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: backgroundColor,
          title: '홈'.text.bold.size(20).make().pSymmetric(h:10),
          iconTheme: const IconThemeData(
            size: 30,
            color: Color.fromARGB(255, 45, 45, 45),
          ),
        ),
      ),
      endDrawer:const DrawerWidget(),
      body: Center(
        child: Column(
          children: [
            height10,
            const ScrollingTextWidget(
              moveText: '움직이는 공지 텍스트 입니다. 길이가 길어지면 그만큼 속도가 조절 됩니다.'
            ),
            height20,height5,
            Container(
              color: backgroundColor,
              height: 173,
              width: screenWidth,
              child: Stack(
                children: [
                  //버스 이미지 필요
                  Column(
                    children: [
                      Row(children: [
                        'xxx님, 안녕하세요!'.text.size(FontSiz18).make()]),
                      Row(children: [
                        date.text.size(FontSiz12).color(baseColor).make()]),
                      height20,
                      Container(
                        height: 106,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 0,
                              blurRadius: 7.0,
                              offset: Offset(0, 6), // changes position of shadow
                            ),],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ).pOnly(left:10),
      )
    );
  }
}

// Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() => '$tokens'.text.make()), // Obx를 사용하여 tokens를 감시하고 업데이트된 값으로 화면을 갱신
//             const SizedBox(height: 20),
//             //ScrollingTextWidget(),// 공지 텍스트 위젯
//             TextButton(
//               onPressed: () async {
//                 //_checkToken(); // 토큰 확인
//               },
//               child: const Text('Click Token Check'),
//             ),
//           ],
//         ),
//       ),