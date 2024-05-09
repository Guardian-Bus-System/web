import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/screen/widget/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/widget/CustomSide/font_size.dart';
import 'package:capstone_front/screen/widget/CustomSide/spaceing_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widget/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  final Rx<UserData> user;

  ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(73.0),
        child: Column(
          children: [
            CustomAppBar(
              appBarTitle: '내 프로필',
            ),
            Divider(),
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
                    '${user.value.name}님'.text.bold.size(FontSiz18).make()
                  ],
                ),
                height15,
                'x월 x일 예정 도착지 - 동대구역'.text.bold.size(FontSiz15).color(Colors.red).make(),
                height30,
              ],
            ).pOnly(left: 25),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height15,
                '내 정보'.text.bold.size(FontSiz18).make(),
                SizedBox(height: 17),
                
              ],
            ).pOnly(left: 25)
          ],
        ),
      ),
    );
  }
}
