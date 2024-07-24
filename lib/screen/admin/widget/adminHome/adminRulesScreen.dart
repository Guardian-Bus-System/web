import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/admin/widget/adminTitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminRulesScreen extends StatefulWidget {
  const AdminRulesScreen({super.key});

  @override
  State<AdminRulesScreen> createState() => _AdminRulesScreenState();
}

class _AdminRulesScreenState extends State<AdminRulesScreen> {

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return Column(
      children: [
        TitleWidget(title: '규칙 관리'),
        height15,
        Container(
          width: screen.width,
          height: screen.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                children: [
                  '번호'.text.bold.size(FontSiz15).make().pOnly(left: 2),
                  '내용'.text.bold.size(FontSiz15).make().pOnly(left: 50),
                ],
              ),
              Container(
                width: screen.width,height: 1,
                decoration: BoxDecoration(border: Border.all(width: 1,color: Color.fromARGB(255, 163, 163, 163)))).pOnly(top: 3.5),
              
              
            ],
          ).pOnly(left: 20, right: 20, top: 15),
        )
      ],
    );
  }
}