import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustonHomeAppbarWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustonHomeAppbarWidget({required this.scaffoldKey, Key? key}) : super(key: key);


  @override
  State<CustonHomeAppbarWidget> createState() => _CustonHomeAppbarWidgetState();
}

class _CustonHomeAppbarWidgetState extends State<CustonHomeAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 35,
            left: 25,
            child: '홈'.text.bold.size(20).make()
          ),
          Positioned(
            top: 25,
            right: 15,
            child: IconButton(
              icon: Icon(
                Icons.menu,
                size: 30
              ), // 햄버거 아이콘
              color: Color.fromARGB(255, 45, 45, 45),
              onPressed: () {
                widget.scaffoldKey.currentState?.openEndDrawer(); // ScaffoldState의 openEndDrawer 메소드 호출
              },
            )
          )
        ],
      ),
    );
  }
}