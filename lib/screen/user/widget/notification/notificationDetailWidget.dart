import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
// ignore: library_prefixes
import 'package:capstone_front/routes/mainView.dart' as mainView;
import 'package:velocity_x/velocity_x.dart';

class NotificationDetailWidget extends StatelessWidget {
  final String noticeText;
  final String dateTime;

  const NotificationDetailWidget({
    Key? key,
    required this.noticeText,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(73.0),
        child: AppBar(
          backgroundColor: backgroundColor,
          scrolledUnderElevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.toNamed('/');
              mainView.MainViewTabController tabController = Get.find();
              tabController.goToTabItem(mainView.TabItem.notice);
            },
            icon: const Icon(Icons.arrow_back, size: 30),
          ),
        ).pSymmetric(h: 5, v: 5),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: backgroundColor, // color_theme.dart에서 가져온 변수
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height20,
              Text(
                noticeText,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: FontSiz15),
              ).paddingOnly(bottom: 2),
              height5,
              Text(
                dateTime,
                style: TextStyle(fontSize: FontSiz12),
              ),
            ],
          ).paddingSymmetric(vertical: 20, horizontal: 25),
        ),
      ),
    );
  }
}
