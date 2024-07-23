import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/admin/widget/adminHome/adminBusAndRules.dart';
import 'package:capstone_front/screen/admin/widget/adminHome/adminMainNotice.dart';
import 'package:capstone_front/screen/admin/widget/adminHome/adminMainStudent.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return Column(
      children: [
        //공지사항
        AdminMainNotices(),
        height25.pOnly(bottom: 2),

        SizedBox(
          width: screen.width,
          height: screen.height * 0.60,
          child: Row(
            children: [
              //학생 목록
              AdminMainStudent(),

              width15.pOnly(left: 3),
              //버스 목록 & 규칙 목록
              AdminBusAndRules()
            ],
          ),
        )
      ],
    );
  }
}