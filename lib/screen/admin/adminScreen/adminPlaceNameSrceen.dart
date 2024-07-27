import 'dart:convert';
import 'package:capstone_front/model/admin/Student.dart';
import 'package:capstone_front/screen/admin/widget/AdminLine.dart';
import 'package:capstone_front/screen/admin/widget/adminStation/adminStationMiddleWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminMiddleWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminStudentRowControllWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminTitleWidget.dart';
import 'package:capstone_front/screen/user/widget/loadingAction.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:http/http.dart' as http;

class Adminplacenamesrceen extends StatefulWidget {
  const Adminplacenamesrceen({Key? key}) : super(key: key);

  @override
  State<Adminplacenamesrceen> createState() => _AdminplacenamesrceenState();
}

class _AdminplacenamesrceenState extends State<Adminplacenamesrceen> {
  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return Column(
      children: [
        const TitleWidget(title: '행선지 관리'),
        AdminStationMiddleWidget(),
        Container(
          width: screen.width,
          height: screen.height * 0.7,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [Row()],
          ).p(20),
        )
      ],
    );
  }
}
