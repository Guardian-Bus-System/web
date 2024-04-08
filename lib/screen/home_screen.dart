import 'package:capstone_front/screen/auth/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/auth/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/auth/authPages/login_page.dart';
import 'package:capstone_front/screen/auth/widgets/drawer_widget.dart';
import 'package:capstone_front/screen/auth/widgets/scrolling_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var tokens = 'No Token'.obs; // GetX에서 사용되는 Rx 변수로 변경

  @override
  void initState() {
    super.initState();
    // initState에서 토큰을 미리 확인
    //_checkToken();
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
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: backgroundColors,
        title: '홈'.text.bold.size(20).make().pSymmetric(h:10),
         actions: [
           TextButton(
             onPressed: () async {
               final SharedPreferences? prefs = await _prefs;
               prefs?.clear();
               Get.offAll(LoginPage());
             },
             child: 'logout'.text.make()
           ),
        ],
      ),),
      endDrawer: DrawerWidget(),
      body: Center(
        child: Column(
          children: [
            height10,
            ScrollingTextWidget().pOnly(left:10)
          ],
        ),
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