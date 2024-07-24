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
  // 체크박스 상태 관리 변수
  bool isCheckedAll = false; // 전체 체크박스 상태
  List<bool> isCheckedList =
      List<bool>.generate(8, (index) => false); // 개별 체크박스 상태

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return Column(
      children: [
        // 제목 컨테이너
        TitleWidget(title: '학생 관리').pOnly(bottom: 35),

        // 정렬 및 검색 버튼
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black)),
                        // 전체 체크박스
                        child: Checkbox(
                          checkColor: Colors.black,
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: isCheckedAll,
                          onChanged: (value) {
                            setState(() {
                              isCheckedAll = value ?? false;
                              // 모든 개별 체크박스 상태를 업데이트
                              isCheckedList = List<bool>.filled(
                                  isCheckedList.length, isCheckedAll);
                            });
                          },
                        ),
                      ),
                      // 이 부분 패딩으로 일일이 지정해줬어용!! 나중에 보고 수정 :D
                      // 화이팅!!!!!!
                      'id'.text.xl.bold.make().pOnly(left: 40),
                      '아이디'.text.xl.bold.make().pOnly(left: 40),
                      '비밀번호'.text.xl.bold.make().pOnly(left: 105),
                      '학년'.text.xl.bold.make().pOnly(left: 125),
                      '반'.text.xl.bold.make().pOnly(left: 40),
                      '번호'.text.xl.bold.make().pOnly(left: 55),
                      '이름'.text.xl.bold.make().pOnly(left: 55),
                      '전화번호'.text.xl.bold.make().pOnly(left: 110),
                      '관리자 권한'.text.xl.bold.make().pOnly(left: 120)
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        width: 75,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 236, 82, 82),
                            borderRadius: BorderRadius.circular(5)),
                        child: '삭제'.text.white.center.xl.make().pOnly(top: 3),
                      ))
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
                    children: List<int>.generate(8, (index) => index)
                        .map((index) => Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        // 개별 체크박스
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.black)),
                                          child: Checkbox(
                                            checkColor: Colors.black,
                                            fillColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                            value: isCheckedList[index],
                                            onChanged: (value) {
                                              setState(() {
                                                isCheckedList[index] =
                                                    value ?? false;
                                                // 모든 체크박스가 체크되었는지 확인하여 전체 체크박스 상태 업데이트
                                                isCheckedAll =
                                                    isCheckedList.every(
                                                        (element) => element);
                                              });
                                            },
                                          ),
                                        ),
                                        // 여기두!!!!! 패딩으로 일일이 지정해줬어용!! 나중에 보고 수정 :D
                                        // 화이팅!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                        '${index + 1}'
                                            .text
                                            .xl
                                            .make()
                                            .pOnly(left: 40),
                                        '0101234567${index}'
                                            .text
                                            .xl
                                            .make()
                                            .pOnly(left: 45),
                                        '****'.text.xl.make().pOnly(left: 60),
                                        '1'.text.xl.make().pOnly(left: 165),
                                        '1'.text.xl.make().pOnly(left: 60),
                                        '${index}'
                                            .text
                                            .xl
                                            .make()
                                            .pOnly(left: 70),
                                        '홍길동'.text.xl.make().pOnly(left: 75),
                                        '0101234567${index}'
                                            .text
                                            .xl
                                            .make()
                                            .pOnly(left: 95),
                                        'X'.text.xl.make().pOnly(left: 80),
                                      ],
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Container(
                                          width: 75,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 73, 216, 70),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: '저장'
                                              .text
                                              .white
                                              .center
                                              .xl
                                              .make()
                                              .pOnly(top: 3),
                                        ))
                                  ],
                                ).pOnly(bottom: 35),
                              ],
                            ))
                        .toList(),
                  )).pOnly(top: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      //style 폼 건들지 말것!!!!!!!!!!!!
                      //녱(sex)
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(40, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      child: Row(children: [
                        Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        '추가하기'.text.black.xl.make(),
                      ])),
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        width: 110,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 67, 140, 251),
                            borderRadius: BorderRadius.circular(5)),
                        child:
                            '엑셀 반환'.text.white.center.xl.make().pOnly(top: 5),
                      ))
                ],
              )
            ],
          ).p(20),
        )
      ],
    );
  }
}
