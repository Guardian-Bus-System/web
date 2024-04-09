import 'package:capstone_front/screen/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/auth/widgets/bus/busList_container.dart';
import 'package:capstone_front/screen/auth/widgets/bus/busUserInfo_container.dart';
import 'package:capstone_front/screen/auth/widgets/custom_appbar.dart';
import 'package:capstone_front/screen/auth/widgets/drawer_widget.dart';
import 'package:capstone_front/screen/auth/widgets/formatter.dart';
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
  var tokens = 'No Token'.obs; 
  String date = '';

  @override
  void initState() {
    date = getFormattedDateTime();
    super.initState();
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
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CustomAppBar(),
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
            BusUserInfoConatainer(
              date: date, containerHeight: 173, containerWidth: screenWidth,
            ),
            height20,height20,
            BusListContainer(listItemHeight: 70, listItemWidth: screenWidth)
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