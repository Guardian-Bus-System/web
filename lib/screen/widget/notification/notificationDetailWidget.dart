import 'package:capstone_front/screen/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/CustomSide/font_size.dart';
import 'package:capstone_front/screen/CustomSide/spaceing_box.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationDetailWidget extends StatefulWidget {
  const NotificationDetailWidget({super.key});

  @override
  State<NotificationDetailWidget> createState() => _NotificationDetailWidgetState();
}

class _NotificationDetailWidgetState extends State<NotificationDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: backgroundColor,
          scrolledUnderElevation: 0,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height15,
              '오늘 3호차 10분 가량 지연될 예정'.text.bold.size(FontSiz16).make().pOnly(bottom: 2),
              height5,
              '2024-04-29'.text.size(FontSiz12).make(),
              height30,
              '오늘 3호차 10분 가량 지연될 예정입니다 학생들은 잠시 기다려 주세요.'.text.size(FontSiz13).make().pOnly(bottom: 2),
            ],
          ).pOnly(top:20, bottom: 21, left: 25, right: 25),
        ),
      ),
    );
  }
}