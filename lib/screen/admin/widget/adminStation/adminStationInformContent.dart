import 'package:flutter/material.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminStationInformContent extends StatefulWidget {
  const AdminStationInformContent({Key? key}) : super(key: key);

  @override
  State<AdminStationInformContent> createState() =>
      _AdminStationInformContent();
}

class _AdminStationInformContent extends State<AdminStationInformContent> {
  // 예시 데이터 모델
  final List<Map<String, dynamic>> data = [
    {
      'mainTitle': '대구',
      'subtitles': [
        {
          'subtitle': '부제목1',
          'buttons': [
            '버튼1',
            '버튼2',
            '버튼1',
            '버튼2',
            '버튼1',
            '버튼2',
            '버튼1',
            '버튼2',
            '버튼1',
            '버튼2',
            '버튼3'
          ]
        },
        {
          'subtitle': '부제목2',
          'buttons': ['버튼4', '버튼5']
        },
      ],
    },
    {
      'mainTitle': '서울',
      'subtitles': [
        {
          'subtitle': '부제목1',
          'buttons': ['버튼1', '버튼2']
        },
        {
          'subtitle': '부제목2',
          'buttons': ['버튼3']
        },
      ],
    },
    {
      'mainTitle': '부산',
      'subtitles': [
        {
          'subtitle': '부제목1',
          'buttons': ['버튼1', '버튼2', '버튼3']
        },
      ],
    },
  ];

  // 스타일 정의
  final TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    Widget buildSubtitleRow(String subtitle, List<String> buttons) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: titleStyle,
          ).paddingOnly(right: 20),
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
                        Text(buttonText,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black))
                            .paddingOnly(right: 5),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 메인 제목
                  Container(
                    width: 100,
                    child: Text(
                      item['mainTitle'],
                      style: titleStyle,
                    ).paddingOnly(right: 20),
                  ),
                  // 부제목과 버튼
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: item['subtitles'].map<Widget>((subtitleItem) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: buildSubtitleRow(subtitleItem['subtitle'],
                              subtitleItem['buttons']),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ).paddingOnly(top: 10),
      ),
    );
  }
}
