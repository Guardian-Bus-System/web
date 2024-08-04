import 'package:capstone_front/screen/admin/widget/adminStation/adminPlaceNameContent.dart';
import 'package:capstone_front/screen/admin/widget/adminStation/adminStationMiddleWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStation/adminTownContent.dart';
import 'package:capstone_front/screen/admin/widget/adminTitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';

class AdminPlaceNameSrceen extends StatefulWidget {
  const AdminPlaceNameSrceen({Key? key}) : super(key: key);

  @override
  State<AdminPlaceNameSrceen> createState() => _AdminPlaceNameSrceenState();
}

class _AdminPlaceNameSrceenState extends State<AdminPlaceNameSrceen> {
  String _currentRoute = '/bus/item2'; // 초기 경로 설정

  void _updateRoute(String route) {
    setState(() {
      _currentRoute = route;
    });
  }

  Widget _buildContent() {
    // 경로에 따라 다른 화면 반환
    switch (_currentRoute) {
      case '/bus/item2':
        return AdminPlaceNameContent();// 지역
      case '/bus/item3':
        return AdminTownContent();// 마을
      default:
        return AdminPlaceNameContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return Column(
      children: [
        const TitleWidget(title: '행선지 관리'),
        Container(
          width: screen.width,
          height: screen.height * 0.7,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              AdminStationMiddleWidget(onMenuItemTap: _updateRoute),
              Container(
                width: screen.width,
                height: 1,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: _buildContent(),
              ),
            ],
          ).p(20),
        )
      ],
    );
  }
}

