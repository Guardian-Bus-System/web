import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';

class AdminTownContent extends StatefulWidget {
  const AdminTownContent({Key? key}) : super(key: key);

  @override
  State<AdminTownContent> createState() => _AdminTownContentState();
}

class _AdminTownContentState extends State<AdminTownContent> {
  // 예시 데이터 모델
  final List<Map<String, dynamic>> data = [
    {
      'title': '대구',
      'buttons': [
        '버튼1',
        '버튼2',
        '버튼3',
        '버튼4',
        '버튼5',
        '버튼6',
        '버튼7',
        '버튼8',
        '버튼9',
        '버튼1',
        '버튼2',
        '버튼3',
        '버튼4',
        '버튼5',
        '버튼6',
        '버튼7',
        '버튼8',
        '버튼9'
      ]
    },
    {
      'title': '서울',
      'buttons': ['버튼1', '버튼2', '버튼3', '버튼4', '버튼5']
    },
    {
      'title': '부산',
      'buttons': ['버튼1', '버튼2', '버튼3']
    },
  ];

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    Widget buildRow(String title, List<String> buttons) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.text.bold.xl.make().pOnly(right: 20),
          Expanded(
            child: Wrap(
              spacing: 20,
              runSpacing: 10,
              children: buttons.map((buttonText) {
                return Container(
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color.fromARGB(255, 45, 45, 45),
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // 패딩 없애기
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buttonText.text.black.xl.make().pOnly(right: 5),
                        IconButton(
                          padding: EdgeInsets.zero, // 패딩 없애기
                          constraints: BoxConstraints(), // 제약 조건 제거
                          icon: const Icon(Icons.close),
                          color: const Color.fromARGB(255, 45, 45, 45),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
    }

    return SizedBox(
      width: screen.width,
      height: screen.height * 0.5,
      child: SingleChildScrollView(
        child: Column(
          children: data.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: buildRow(item['title'], item['buttons']),
            );
          }).toList(),
        ).pOnly(top: 10),
      ),
    );
  }
}
