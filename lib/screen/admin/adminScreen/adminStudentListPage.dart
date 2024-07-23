// admin_main_page.dart
import 'package:capstone_front/screen/admin/widget/adminStudent/adminStudentSearchWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminAliginButtonWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminMiddleWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminDropdownWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminHome/adminBusAndRules.dart';
import 'package:capstone_front/screen/admin/widget/adminHome/adminMainNotice.dart';
import 'package:capstone_front/screen/admin/widget/adminHome/adminMainStudent.dart';
import 'package:capstone_front/screen/admin/widget/adminMenuButtonWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminTitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';

class Adminstudentlistpage extends StatefulWidget {
  const Adminstudentlistpage({Key? key}) : super(key: key);

  @override
  State<Adminstudentlistpage> createState() => _Adminstudentlistpage();
}

class _Adminstudentlistpage extends State<Adminstudentlistpage> {
  int _selectedIndex = 3;
  String? _selectedSubMenu;

  void _toggleMenu(int index) {
    setState(() {
      _selectedIndex = _selectedIndex == index ? -1 : index;
      _selectedSubMenu = null;
    });
  }

  void _onMenuItemTap(Map<String, String> item) {
    setState(() {
      _selectedSubMenu = item['text'];
    });
  }

  void _onButtonTap(int index, String route) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);
    double sideMenuWidth = screen.width * 0.2;

    return Scaffold(
      body: Container(
        color: adminMainBackgroundColor,
        child: Row(
          children: [
            Container(
              color: adminNavigationColor,
              width: sideMenuWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButton(
                    index: 1,
                    buttonName: '홈',
                    icon: Icons.home_outlined,
                    route: '/admin/home',
                    isSingleAction: false,
                    screenWidth: sideMenuWidth,
                    isSelected: _selectedIndex == 1,
                    onTap: () {
                      _toggleMenu(1);
                    },
                  ),
                  height10.pOnly(top: 1),
                  CustomButton(
                    index: 2,
                    buttonName: '공지사항',
                    icon: Icons.notification_add_outlined,
                    route: '',
                    isSingleAction: true,
                    screenWidth: sideMenuWidth,
                    isSelected: _selectedIndex == 2,
                    onTap: () {
                      _onButtonTap(2, '');
                    },
                  ),
                  if (_selectedIndex == 2) ...[
                    height20,
                    MenuWidget(
                      menuItems: const [
                        {'text': '공지 목록', 'route': '/notice/item1'},
                        {'text': '공지 등록', 'route': '/notice/item2'},
                      ],
                      screenWidth: screen.width,
                      onMenuItemTap: _onMenuItemTap,
                      selectedSubMenu: _selectedSubMenu,
                    ),
                  ],
                  height10.pOnly(top: 1),
                  CustomButton(
                    index: 3,
                    buttonName: '학생목록',
                    icon: Icons.people_alt_outlined,
                    route: '',
                    isSingleAction: true,
                    screenWidth: sideMenuWidth,
                    isSelected: _selectedIndex == 3,
                    onTap: () {
                      _onButtonTap(3, '');
                    },
                  ),
                  if (_selectedIndex == 3) ...[
                    height20,
                    MenuWidget(
                      menuItems: const [
                        {'text': '학생 관리', 'route': '/students/item1'},
                        {'text': '학생 탑승 내역', 'route': '/students/item2'},
                      ],
                      screenWidth: screen.width,
                      onMenuItemTap: _onMenuItemTap,
                      selectedSubMenu: _selectedSubMenu,
                    ),
                  ],
                  height10.pOnly(top: 1),
                  CustomButton(
                    index: 4,
                    buttonName: '버스목록',
                    icon: Icons.bus_alert_outlined,
                    route: '/bus',
                    isSingleAction: false,
                    screenWidth: sideMenuWidth,
                    isSelected: _selectedIndex == 4,
                    onTap: () {
                      _toggleMenu(4);
                    },
                  ),
                  if (_selectedIndex == 4) ...[
                    height20,
                    MenuWidget(
                      menuItems: const [
                        {'text': '버스 목록 관리', 'route': ''},
                        {'text': '행선지 관리', 'route': ''},
                      ],
                      screenWidth: screen.width,
                      onMenuItemTap: _onMenuItemTap,
                      selectedSubMenu: _selectedSubMenu,
                    ),
                  ],
                  height10.pOnly(top: 1),
                  CustomButton(
                    index: 5,
                    buttonName: '규칙목록',
                    icon: Icons.rule,
                    route: '/rules',
                    isSingleAction: false,
                    screenWidth: sideMenuWidth,
                    isSelected: _selectedIndex == 5,
                    onTap: () {
                      _toggleMenu(5);
                    },
                  ),
                ],
              ).pOnly(top: 70, left: 30, right: 30),
            ),

            // 여기서부터 메인 코드!
            Container(
              width: screen.width - (sideMenuWidth * 1.33),
              height: screen.width,
              decoration: const BoxDecoration(
                color: adminMainBackgroundColor,
              ),
              child: Column(
                children: [
                  // 제목 컨테이너
                  TitleWidget(title: '학생 관리').pOnly(bottom: 55),

                  // 정렬 및 검색 버튼
                  AdminMiddleWidget(),

                  Container(
                    width: screen.width,
                    height: 700,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            'id'.text.xl.bold.make().pOnly(left: 40),
                            '아이디'.text.xl.bold.make().pOnly(left: 40),
                            '비밀번호'.text.xl.bold.make().pOnly(left: 105),
                            '학년'.text.xl.bold.make().pOnly(left: 125),
                            '반'.text.xl.bold.make().pOnly(left: 40),
                            '번호'.text.xl.bold.make().pOnly(left: 55),
                            '이름'.text.xl.bold.make().pOnly(left: 55),
                            '전화번호'.text.xl.bold.make().pOnly(left: 125),
                            '관리자 권한'.text.xl.bold.make().pOnly(left: 135),
                          ],
                        ),
                        Container(
                          width: screen.width,
                          height: 1,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 163, 163, 163))),
                        ).pOnly(top: 10, bottom: 10),
                      ],
                    ).pOnly(left: 20, top: 20, bottom: 20),
                  )
                ],
              ),
            ).pOnly(top: 70, bottom: 0, left: 50, right: 50)
          ],
        ),
      ),
    );
  }
}
