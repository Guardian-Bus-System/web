import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/user/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomAppBar extends StatelessWidget {
  final String appBarTitle;

  const CustomAppBar({Key? key, required this.appBarTitle }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: appBarTitle == '공지사항' || appBarTitle == '내 프로필'  ? false : true,
      leading:appBarTitle == '공지사항' ? null : IconButton(
        icon:const Icon(Icons.arrow_back, size: 30,), onPressed: () { Get.to(HomeScreen()); },
      ).pOnly(left: 10),
      backgroundColor: bacgroundOrTextColor,
      title: appBarTitle.text.bold.size(20).make().pSymmetric(h:10),
      centerTitle: appBarTitle == '버스 경로 변경'? true : false,
    );
  }
}
