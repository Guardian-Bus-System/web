// admin_main_page.dart
import 'package:capstone_front/screen/admin/widget/header_widget.dart';
import 'package:capstone_front/screen/admin/widget/student_busItem_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/admin/widget/adminMenuButtonWidget.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  int _selectedIndex = 1;
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
    //Navigator.pushNamed(context, item['route']);
  }

  void _onButtonTap(int index, String route) {
    setState(() {
      _selectedIndex = index;
    });
    //Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);
    double screenWidth = screen.width;
    double screenHeight = screen.height;

    double sideMenuWidth = screenWidth * 0.2;

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
                    index: 1,buttonName: '홈',
                    icon: Icons.home_outlined, route: '/admin/home',
                    isSingleAction: false, screenWidth: sideMenuWidth,
                    isSelected: _selectedIndex == 1,
                    onTap: () {
                      _toggleMenu(1);
                    },
                  ),
                  height10.pOnly(top: 1),
                  CustomButton(
                    index: 2, buttonName: '공지사항',
                    icon: Icons.notification_add_outlined,
                    route: '', isSingleAction: true, screenWidth: sideMenuWidth,
                    isSelected: _selectedIndex == 2,
                    onTap: () {
                      _onButtonTap(2, '');
                    },
                  ),
                  if (_selectedIndex == 2) ...[
                    height20,
                    MenuWidget(
                      menuItems: [
                        {'text': '공지 목록', 'route': '/notice/item1'},
                        {'text': '공지 등록', 'route': '/notice/item2'},
                      ],
                      screenWidth: screenWidth,
                      onMenuItemTap: _onMenuItemTap,
                      selectedSubMenu: _selectedSubMenu,
                    ),
                  ],
                  height10.pOnly(top: 1),
                  CustomButton(
                    index: 3, buttonName: '학생목록',
                    icon: Icons.people_alt_outlined,
                    route: '', isSingleAction: true, screenWidth: sideMenuWidth,
                    isSelected: _selectedIndex == 3,
                    onTap: () {
                      _onButtonTap(3, '');
                    },
                  ),
                  if (_selectedIndex == 3) ...[
                    height20,
                    MenuWidget(
                      menuItems: [
                        {'text': '학생 관리', 'route': '/students/item1'},
                        {'text': '학생 탑승 내역', 'route': '/students/item2'},
                        {'text': '학생 관리자 관리', 'route': '/students/item2'},
                      ],
                      screenWidth: screenWidth,
                      onMenuItemTap: _onMenuItemTap,
                      selectedSubMenu: _selectedSubMenu,
                    ),
                  ],
                  height10.pOnly(top: 1),
                  CustomButton(
                    index: 4, buttonName: '버스목록',
                    icon: Icons.bus_alert_outlined,
                    route: '/bus', isSingleAction: false, screenWidth: sideMenuWidth,
                    isSelected: _selectedIndex == 4,
                    onTap: () {
                      _toggleMenu(4);
                    },
                  ),
                  if (_selectedIndex == 4) ...[
                    height20,
                    MenuWidget(
                      menuItems: [
                        {'text': '버스 목록 관리', 'route': ''},
                        {'text': '행선지 관리', 'route': ''},
                      ],
                      screenWidth: screenWidth,
                      onMenuItemTap: _onMenuItemTap,
                      selectedSubMenu: _selectedSubMenu,
                    ),
                  ],
                  height10.pOnly(top: 1),
                  CustomButton(
                    index: 5, buttonName: '규칙목록',
                    icon: Icons.rule,
                    route: '/rules', isSingleAction: false,
                    screenWidth: sideMenuWidth,
                    isSelected: _selectedIndex == 5,
                    onTap: () {
                      _toggleMenu(5);
                    },
                  ),
                ],
              ).pOnly(top: 70, left: 30, right: 30),
            ),
            // Rest of your main content goes here...
            Container(
              width: screenWidth - (sideMenuWidth * 1.33),
              height: screenHeight,
              decoration: BoxDecoration(
                color: adminMainBackgroundColor,
              ),
        
              child: Column(
                children: [
                  //공지사항
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.2109,
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                    child: Container(
                      width: screenWidth,
                      height: screenHeight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderWidget(title: '공지사항', onPressed: () {},),
                          
                          Expanded(
                            child: ListView(
                              children: List<int>.generate(2, (index) => index)
                                .map((index) => 'list item $index'.text.xl2.make())
                                .toList(),
                            ),
                          )
                          
                        ],
                      ).pSymmetric(h:20, v:20),
                    ),
                  ),
                  height40.pOnly(bottom: 2),
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.53,
                    child: Row(
                      children: [
                        //학생 목록
                        Container(
                          width: screenWidth * 0.4687,
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                          child: Theme(
                            data: ThemeData(
                              scrollbarTheme: ScrollbarThemeData(
                                thumbColor: MaterialStateProperty.all<Color>(Colors.white),
                              ),
                            ),
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeaderWidget(title: '학생 목록', onPressed: () {}),
                                    //버그 잡아줘잉 
                                    // 해결 썩섹스 ^^
                                  Container(
                                    width: screenWidth * 0.63,
                                    height: screenHeight * 0.6705,
                                    child: ListView(// 공주 여기세로 스크롤 해야 함묭?
                                      // 아니용
                                      scrollDirection: Axis.horizontal,
                                      children: List<int>.generate(5, (busNum) => busNum)
                                        .map((busNum) => StudentBusItemWidget(busNumber: busNum)).toList(),
                                    ),
                                  )
                                ],
                              ).pOnly(top:20, left:20, right: 20),
                            ),
                          ),
                        ),
                        width15.pOnly(left: 3),

                        Container(
                          width: screenWidth * 0.25,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                          child: Column(
                            children: [
                              //버스 목록
                              Container(
                                height: screenHeight * 0.274,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                                child: 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeaderWidget(title: '버스 목록', onPressed: () {}),
                                    Expanded(
                                      child: ListView(
                                        children: List<int>.generate(5, (index) => index)
                                          .map((index) => '${index+1}bus information '.text.xl.make().pOnly(top: 4, bottom: 1))
                                          .toList(),
                                      ),
                                    )
                                  ],
                                ).pOnly(top: 20, left: 20, right: 20)
                              ),
                              height20,
                              //탑승규칙
                              Container(
                                height: screenHeight * 0.232,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                                child: Container(
                                  width: screenWidth,
                                  child: Column(
                                    children: [
                                      HeaderWidget(title: '탑승규칙', onPressed: () {}),
                                      Expanded(
                                        child: ListView(
                                          children: List<int>.generate(4, (index) => index)
                                          .map((index) => '${index+1}. item informaion.'.text.xl.make().pOnly(top: 4, bottom: 1))
                                          .toList(),
                                        )
                                      )
                                    ],
                                  ).pOnly(top: 20, left: 20, right: 20)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ).pOnly(top: 71, bottom: 35,left: 50, right: 50)
          ],
        ),
      ),
    );
  }
}
