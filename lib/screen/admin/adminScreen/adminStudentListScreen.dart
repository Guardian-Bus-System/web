// admin_main_page.dart
import 'package:capstone_front/screen/admin/widget/adminStudent/adminMiddleWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminTitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';

class AdminStudentListScreen extends StatefulWidget {
  const AdminStudentListScreen({Key? key}) : super(key: key);

  @override
  State<AdminStudentListScreen> createState() => _AdminStudentListScreenState();
}

class _AdminStudentListScreenState extends State<AdminStudentListScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);
    bool? isChecked = true;

    return Column(
      children: [
        // 제목 컨테이너
        TitleWidget(title: '학생 관리').pOnly(bottom: 35),

        // 정렬 및 검색 버튼
        AdminMiddleWidget(),

        Container(
          width: screen.width,
          height: screen.height * 0.6,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //checkbox
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black)),
                    child: Checkbox(
                      checkColor: Colors.black,
                      overlayColor: const WidgetStatePropertyAll(
                          Color.fromARGB(0, 255, 255, 255)),
                      fillColor: const WidgetStatePropertyAll(
                          Color.fromARGB(0, 255, 255, 255)),
                      isError: true,
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  'id'.text.xl.bold.make().pOnly(left: 40),
                  '아이디'.text.xl.bold.make().pOnly(left: 40),
                  '비밀번호'.text.xl.bold.make().pOnly(left: 105),
                  '학년'.text.xl.bold.make().pOnly(left: 125),
                  '반'.text.xl.bold.make().pOnly(left: 40),
                  '번호'.text.xl.bold.make().pOnly(left: 55),
                  '이름'.text.xl.bold.make().pOnly(left: 55),
                  '전화번호'.text.xl.bold.make().pOnly(left: 110),
                  '관리자 권한'.text.xl.bold.make().pOnly(left: 120),
                ],
              ),
              Container(
                width: screen.width,
                height: 1,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Color.fromARGB(255, 163, 163, 163))),
              ).pOnly(top: 10, bottom: 10),
            ],
          ).pOnly(left: 20, top: 20, bottom: 20),
        )
      ],
    );
  }
}
