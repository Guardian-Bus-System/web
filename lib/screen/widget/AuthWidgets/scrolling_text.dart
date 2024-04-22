import 'package:capstone_front/screen/CustomSide/font_size.dart';
import 'package:capstone_front/screen/CustomSide/spaceing_box.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ScrollingTextWidget extends StatefulWidget {
  final String moveText;

  const ScrollingTextWidget({required this.moveText });
  
  @override
  _ScrollingTextWidgetState createState() => _ScrollingTextWidgetState();
}

class _ScrollingTextWidgetState extends State<ScrollingTextWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _scrollPosition = 0.0;
  final double _containerWidth = 235.0; // 임시 컨테이너 너비

  
  @override
  void initState() {
    
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 12), // 텍스트가 화면을 통과하는 시간
    )..repeat();
    _controller.addListener(() {
      setState(() {
        _scrollPosition = _controller.value * (_containerWidth * 2.5); // 텍스트가 움직이는 위치
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Container(
            width: screenWidth - 50,
            height: 31,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                )
              ]
            ),
            child: Row(
              children: [
                '공지'.text.bold.make(),
                width10,
                Container(
                  width: screenWidth - 113,
                  height: 20, // 텍스트 박스의 높이
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      Positioned(
                        right: _scrollPosition - (screenWidth - 90),
                        child: widget.moveText.text.size(FontSiz14).make()
                      ),
                    ],
                  ),
                ),
              ],
            ).pSymmetric(h: 12),
          ),
          Positioned(
            right: 0, // 컨테이너의 우측 가장자리로부터 10픽셀 떨어뜨림
            top: 0, // 컨테이너의 상단 가장자리로부터 10픽셀 떨어뜨림
            child: Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}