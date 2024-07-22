import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/admin/widget/adminHome/adminMainStudent.dart';
import 'package:capstone_front/screen/admin/widget/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminBusAndRules extends StatelessWidget {
  const AdminBusAndRules({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return SizedBox(
      width: screen.width * 0.25,
      child: Column(
        children: [
          //버스 목록
          Container(
            height: screen.height * 0.286,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(title: '버스 목록', onPressed: () {}),
                Expanded(
                  child: ListView(
                    children: List<int>.generate(5, (index) => index)
                      .map((index) => '${index+1}bus information '.text.xl.make().pOnly(top: 4, bottom: 1))
                      .toList(),
                  ),
                )
              ],
            ).pOnly(top: 20, left: 20, right: 20)
          ),
          height20,
          //탑승규칙
          Container(
            height: screen.height * 0.286,
            width: screen.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              children: [
                HeaderWidget(title: '탑승규칙', onPressed: () {}),
                Expanded(
                  child: ListView(
                    children: List<int>.generate(4, (index) => index)
                    .map((index) => '${index+1}. item informaion.'.text.xl.make().pOnly(top: 4, bottom: 1))
                    .toList(),
                  )
                )
              ],
            ).pOnly(top: 20, left: 20, right: 20),
          ),
        ],
      ),
    );
  }
}