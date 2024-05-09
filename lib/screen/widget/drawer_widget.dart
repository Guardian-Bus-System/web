import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/screen/pages/profile_screen.dart';
import 'package:capstone_front/screen/widget/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/widget/CustomSide/font_size.dart';
import 'package:capstone_front/screen/widget/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/auth/change_pw_page.dart';
import 'package:capstone_front/screen/auth/login_page.dart';
import 'package:capstone_front/utils/img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class DrawerWidget extends StatelessWidget {
  final Rx<UserData> user;

  const DrawerWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    return Container(
      color: bacgroundOrTextColor,
      child: Drawer(
        backgroundColor: drawerBacgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(GoBusLogo, width: 95),
            height20,
            height5,
            InkWell(
              onTap: () {
                Get.to(ProfileScreen(user: user));
                
              },
              child: Row(
                children: [
                  '학생'.text.bold.color(baseColor).size(FontSiz18).make(),
                  ' ${user.value.grade
                  }${user.value.classNumber
                  }${user.value.number > 9 
                    ? user.value.number 
                    : '0${user.value.number}'
                  } ${user.value.name}'.text.bold.size(FontSiz18).make(),
                ],
              ),
            ),
            height20,
            height20,
            customInkWell(
              onTap: () async {
                final SharedPreferences? prefs = await _prefs;
                if (user.value.name != 'undefinde') {
                  prefs?.clear();
                }
                  Get.offAll(const LoginPage());
              },
              text: user.value.name != 'undefinde' ? '로그아웃' : '로그인',
            ),
            height20,
            customInkWell(
              onTap: () async {
                Get.to(ChangePwPage(userName: user.value.name));
              },
              text: '회원정보 변경',
            ),
            height20,
            customInkWell(
              onTap: () async {
                Get.toNamed('/notification');
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
            height20,
            customInkWell(
              onTap: () async {
                // 여기에 async로 실행될 동작을 추가하세요
                Get.to(ProfileScreen(user: user));
              },
              text: '프로필',
            ),
          ],
        ).pOnly(top: 69, left: 29),
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
