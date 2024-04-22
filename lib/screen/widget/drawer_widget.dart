import 'package:capstone_front/screen/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/CustomSide/font_size.dart';
import 'package:capstone_front/screen/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/auth/authPages/change_pw_page.dart';
import 'package:capstone_front/screen/auth/authPages/login_page.dart';
import 'package:capstone_front/screen/widget/AuthWidgets/submit_button.dart';
import 'package:capstone_front/utils/img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    bool isLogin = false;

    return Container(
      color: bacgroundOrTextColor,
      child: Drawer(
        backgroundColor: drawerBacgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(GoBusLogo,width: 95),
            height20,height5,
            Row(
              children: [
                '학생'.text.bold.color(baseColor).size(FontSiz18).make(),
                ' 3104 김주오'.text.bold.size(FontSiz18).make()
              ],
            ),
            height20,height20,
            customInkWell(
              onTap: () async {
                final SharedPreferences? prefs = await _prefs;
                prefs?.clear();
                if (isLogin) {
                  Get.offAll(const LoginPage());
                } else {
                  Get.offAll(LoginPage());
                }
              },
              text: isLogin ? '로그아웃' : '로그인',
            ),
            height20,
            customInkWell(
              onTap: () async {
                // 여기에 async로 실행될 동작을 추가하세요
                Get.to(ChangePwPage(userName: '나다 이씹새꺄',));
              },
              text: '회원정보 변경',
            ),
            height20,
            customInkWell(
              onTap: () async {
                // 여기에 async로 실행될 동작을 추가하세요
                Get.toNamed('/notification'
                  //screenWidth: screenWidth
                );
              },
              text: '공지사항',
            ),
            height20,
            customInkWell(
              onTap: () async {
                // 여기에 async로 실행될 동작을 추가하세요
              },
              text: '호차정보',
            ),
          ],
        ).pOnly(top: 69, left: 29)
      ),
    );
  }
}

Widget customInkWell({
  required Future<void> Function() onTap,
  required String text,
}) {
  return InkWell(
    onTap: onTap,
    child: text.text.bold.size(FontSiz15).make(),
  );
}