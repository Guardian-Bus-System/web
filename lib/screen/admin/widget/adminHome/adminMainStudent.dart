import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/screen/admin/widget/adminHome/header_widget.dart';
import 'package:capstone_front/screen/admin/widget/student_busItem_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminMainStudent extends StatelessWidget {
  const AdminMainStudent({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);
    
    return Container(
      width: screen.width * 0.4687,
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
      child: Theme(
        data: ThemeData(
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(title: '학생 목록', onPressed: () {}),
                //버그 잡아줘잉 
                // 해결 썩섹스 ^^
              SizedBox(
                width: screen.width * 0.63,
                height: screen.height * 0.6705,
                child: ListView(// 공주 여기세로 스크롤 해야 함묭?
                  // 아니용
                  scrollDirection: Axis.horizontal,
                  children: List<int>.generate(5, (busNum) => busNum)
                    .map((busNum) => StudentBusItemWidget(busNumber: busNum)).toList(),
                ),
              )
            ],
          ).pOnly(top:20, left:20, right: 20),
        ),
      ),
    );
  }
}