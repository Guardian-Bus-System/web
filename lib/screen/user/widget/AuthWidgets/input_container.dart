import 'package:flutter/material.dart';

class JoinContainer extends StatelessWidget {
  final Widget widget;
  const JoinContainer({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.62,
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 2.0,
            offset: Offset(0, 2), // changes position of shadow
          ),], // 그림자 추가
        borderRadius: BorderRadius.circular(10.0), // 컨테이너의 모서리를 둥글게 만듦
      ),
      child: widget,
    );
  }
}