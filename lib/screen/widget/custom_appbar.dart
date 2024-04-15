import 'package:capstone_front/screen/CustomSide/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomAppBar extends StatelessWidget {
  final String appBarTitle;

  const CustomAppBar({Key? key, required this.appBarTitle }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: bacgroundOrTextColor,
      title: appBarTitle.text.bold.size(20).make().pSymmetric(h:10),
      centerTitle: appBarTitle == '버스 경로 변경'  ? true : false,
      actions:[
        appBarTitle == '홈' ?  Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                size: 30
              ), // 햄버거 아이콘
              color: Color.fromARGB(255, 45, 45, 45),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // ScaffoldState의 openEndDrawer 메소드 호출
              },
            ).pOnly(right: 10);
          }
        )
        : Container()
      ] 
    );
  }
}
