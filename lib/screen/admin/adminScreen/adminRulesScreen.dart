import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/admin/widget/AdminLine.dart';
import 'package:capstone_front/screen/admin/widget/adminRowAddButtonWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminRule/adminRuleItemTextFieldWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminStudentRowControllWidget.dart';
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
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  '번호'.text.bold.xl.make().pOnly(left: 2),
                  '내용'.text.bold.xl.make().pOnly(left: 50),
                ],
              ),
              const AdminLine(),
              SizedBox(
                width: screen.width,
                height: screen.height * 0.535,
                child: ListView.builder(
                  itemCount: 10, // 실제 데이터 항목 수에 맞게 조정
                  itemBuilder: (context, index) {
                    return StudentRowControllRuleWidget(
                      id: index,
                      content: '규칙이당$index',
                    );
                  },
                ),
              ).pOnly(top: 20),
              
              AdminRowAddButtonWidget(onPressed: () {},)
            ],
          ).p(20),
        ),
      ],
    );
  }
}
