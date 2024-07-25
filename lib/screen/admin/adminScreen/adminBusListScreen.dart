//전체 버스 목록 screen
import 'package:capstone_front/screen/admin/widget/adminTitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';

class AdminBusListScreen extends StatefulWidget {
  const AdminBusListScreen({Key? key}) : super(key: key);

  @override
  State<AdminBusListScreen> createState() => _AdminBusListScreenState();
}

class _AdminBusListScreenState extends State<AdminBusListScreen> {
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
        const TitleWidget(title: '버스 목록 관리'),

        //버스 목록
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
                      '호차 번호'.text.xl.bold.make().pOnly(left: 40),
                      '호차 이름'.text.xl.bold.make().pOnly(left: 40),
                      '중간 지점'.text.xl.bold.make().pOnly(left: 40),
                      '버스 종착지'.text.xl.bold.make().pOnly(left: 190),
                      '좌석수'.text.xl.bold.make().pOnly(left: 170),
                      '생성 날짜'.text.xl.bold.make().pOnly(left: 40),
                      '수정 날짜'.text.xl.bold.make().pOnly(left: 60),
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

              // 버스 목록
              SizedBox(
                  width: screen.width,
                  height: screen.height * 0.535,
                  child: ListView(
                    children: List<int>.generate(5, (index) => index)
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
                                        '${index + 1}호차'
                                            .text
                                            .xl
                                            .make()
                                            .pOnly(left: 45),
                                        '대구방면'.text.xl.make().pOnly(left: 75),

                                        //중간지점 다중 선택을 어떻게 처리해야 할까..?
                                        '중간지점 선택....'
                                            .text
                                            .xl
                                            .make()
                                            .pOnly(left: 40),

                                        '동대구역'.text.xl.make().pOnly(left: 140),

                                        '45'.text.xl.make().pOnly(left: 200),
                                        '2024-05-09'
                                            .text
                                            .xl
                                            .make()
                                            .pOnly(left: 70),
                                        '2024-05-09'
                                            .text
                                            .xl
                                            .make()
                                            .pOnly(left: 45),
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
                                ).pOnly(bottom: 30),
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
                ],
              )
            ],
          ).p(20),
        )
      ],
    );
  }
}
