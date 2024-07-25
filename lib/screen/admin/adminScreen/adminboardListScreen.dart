// 학생 탑승 내역 screen
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminMiddleWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminTitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminBoardListScreen extends StatefulWidget {
  const AdminBoardListScreen({Key? key}) : super(key: key);

  @override
  State<AdminBoardListScreen> createState() => _AdminBoardListScreenState();
}

class _AdminBoardListScreenState extends State<AdminBoardListScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return Column(
      children: [
        //제목 컨테이너
        TitleWidget(title: '학생 탑승 내역').pOnly(bottom: 35),

        //정렬 및 검색 버튼
        AdminMiddleWidget(),

        //학생 목록
        Container(
          width: screen.width,
          height: screen.height * 0.7,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // 이 부분 패딩으로 일일이 지정해줬어용!! 나중에 보고 수정 :D
                  // 화이팅!!!!!!
                  '학번'.text.xl.bold.make().pOnly(left: 38),
                  '이름'.text.xl.bold.make().pOnly(left: 79),
                  '탑승 호차'.text.xl.bold.make().pOnly(left: 90),
                  '도착지'.text.xl.bold.make().pOnly(left: 80)
                ],
              ),
              Container(
                width: screen.width,
                height: 1,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Color.fromARGB(255, 163, 163, 163))),
              ).pOnly(top: 10, bottom: 10),

              // 학생 목록
              SizedBox(
                  width: screen.width,
                  height: screen.height * 0.535,
                  child: ListView(
                    children: List<int>.generate(9, (index) => index)
                        .map((index) => Column(
                              children: [
                                Row(
                                  children: [
                                    // 여기두!!!!! 패딩으로 일일이 지정해줬어용!! 나중에 보고 수정 :D
                                    // 화이팅!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                    '110${index + 1}'
                                        .text
                                        .xl
                                        .make()
                                        .pOnly(left: 40),
                                    '홍길동'.text.xl.make().pOnly(left: 75),
                                    '1호차'.text.xl.make().pOnly(left: 95),
                                    '동대구역'.text.xl.make().pOnly(left: 80),
                                  ],
                                ).pOnly(bottom: 35),
                              ],
                            ))
                        .toList(),
                  )).pOnly(top: 20),
            ],
          ).p(20),
        )
      ],
    );
  }
}
