import 'package:capstone_front/screen/admin/adminScreen/adminBusListScreen.dart';
import 'package:capstone_front/screen/admin/adminScreen/adminHomeScreen.dart';
import 'package:capstone_front/screen/admin/adminScreen/adminNoticeScreen.dart';
import 'package:capstone_front/screen/admin/adminScreen/adminPlaceNameSrceen.dart';
import 'package:capstone_front/screen/admin/adminScreen/adminStudentListScreen.dart';
import 'package:capstone_front/screen/admin/adminScreen/adminboardListScreen.dart';
import 'package:capstone_front/screen/admin/adminScreen/adminRulesScreen.dart';
import 'package:capstone_front/screen/admin/widget/adminMenuButtonWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminNotice/adminNoticeAddContent.dart';
import 'package:capstone_front/screen/admin/widget/adminStation/adminTownContent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';

class AdminController extends GetxController {
  var selectedIndex = 1.obs;
  var selectedSubMenu = Rxn<String>();
  var currentRoute = ''.obs;
}

class AdminMainPage extends StatelessWidget {
  AdminMainPage({Key? key}) : super(key: key);

  final AdminController controller = Get.put(AdminController());

  void _toggleMenu(int index) {
    controller.selectedIndex.value =
        controller.selectedIndex.value == index ? -1 : index;
    controller.selectedSubMenu.value = null;
  }

  void _onMenuItemTap(Map<String, String> item) {
    controller.selectedSubMenu.value = item['text'];
    controller.currentRoute.value = item['route']!;
  }

  void _onButtonTap(int index, String route) {
    controller.selectedIndex.value = index;
    controller.currentRoute.value = route;
  }

  Widget _buildContent() {
    //누르는 메뉴에 따른 화면 변환
    switch (controller.currentRoute.value) {
      case '/admin/home':
        return AdminHomeScreen(); // 홈 화면
      case '/notice/item1':
        return AdminNoticesScreen(); //공지 화면
      case '/notice/item2':
        return AdminNoticeAddContent(
          screenTitle: '공지 등록',
          fButtonText: '게시', sButtonText: '삭제',
          sOnPressed: () { //cancel logic
             _toggleMenu(2);
            _onButtonTap(2, '/notice/item1');
          }, // 취소 로직
        ); //공지
      case '/students':
        return AdminStudentListScreen();  
      case '/students/item1':
        return AdminStudentListScreen(); //학생관리
      case '/students/item2':
        return AdminBoardListScreen(); // 학생 탑승 내역
      case '/bus':
        return AdminBusListScreen(); //버스
      case '/bus/item2':
        return AdminPlaceNameSrceen();
      case '/bus/item3':
        return AdminTownContent();
      case '/rules':
        return AdminRulesScreen(); //규칙
      default:
        return AdminHomeScreen(); //기본 화면
    }
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
                  Obx(() => CustomButton(
                        index: 1,
                        buttonName: '홈',
                        icon: Icons.home_outlined,
                        route: '/admin/home',
                        isSingleAction: false,
                        screenWidth: sideMenuWidth,
                        isSelected: controller.selectedIndex.value == 1,
                        onTap: () {
                          _toggleMenu(1);
                          _onButtonTap(1, '/admin/home');
                        },
                      )),
                  height10.pOnly(top: 1),
                  Obx(() => CustomButton(
                        index: 2,
                        buttonName: '공지사항',
                        icon: Icons.notification_add_outlined,
                        route: '',
                        isSingleAction: true,
                        screenWidth: sideMenuWidth,
                        isSelected: controller.selectedIndex.value == 2,
                        onTap: () {
                          _toggleMenu(2);
                          _onButtonTap(2, '/notice/item1');
                        },
                      )),
                  Obx(() {
                    if (controller.selectedIndex.value == 2) {
                      return Column(
                        children: [
                          height20,
                          MenuWidget(
                            menuItems: const [
                              {'text': '공지 목록', 'route': '/notice/item1'},
                              {'text': '공지 등록', 'route': '/notice/item2'},
                            ],
                            screenWidth: screen.width,
                            onMenuItemTap: _onMenuItemTap,
                            selectedSubMenu: controller.selectedSubMenu.value,
                          ),
                        ],
                      );
                    }
                    return Container();
                  }),
                  height10.pOnly(top: 1),
                  Obx(() => CustomButton(
                        index: 3,
                        buttonName: '학생목록',
                        icon: Icons.people_alt_outlined,
                        route: '',
                        isSingleAction: true,
                        screenWidth: sideMenuWidth,
                        isSelected: controller.selectedIndex.value == 3,
                        onTap: () {
                          _toggleMenu(3);
                          _onButtonTap(3, '/students');
                        },
                      )),
                  Obx(() {
                    if (controller.selectedIndex.value == 3) {
                      return Column(
                        children: [
                          height20,
                          MenuWidget(
                            menuItems: const [
                              {'text': '학생 관리', 'route': '/students/item1'},
                              {'text': '학생 탑승 내역', 'route': '/students/item2'},
                            ],
                            screenWidth: screen.width,
                            onMenuItemTap: _onMenuItemTap,
                            selectedSubMenu: controller.selectedSubMenu.value,
                          ),
                        ],
                      );
                    }
                    return Container();
                  }),
                  height10.pOnly(top: 1),
                  Obx(() => CustomButton(
                        index: 4,
                        buttonName: '버스목록',
                        icon: Icons.bus_alert_outlined,
                        route: '/bus',
                        isSingleAction: false,
                        screenWidth: sideMenuWidth,
                        isSelected: controller.selectedIndex.value == 4,
                        onTap: () {
                          _toggleMenu(4);
                          _onButtonTap(4, '/bus');
                        },
                      )),
                  Obx(() {
                    if (controller.selectedIndex.value == 4) {
                      return Column(
                        children: [
                          height20,
                          MenuWidget(
                            menuItems: const [
                              {'text': '버스 목록 관리', 'route': '/bus'},
                              {'text': '행선지 관리', 'route': '/bus/item2'},
                            ],
                            screenWidth: screen.width,
                            onMenuItemTap: _onMenuItemTap,
                            selectedSubMenu: controller.selectedSubMenu.value,
                          ),
                        ],
                      );
                    }
                    return Container();
                  }),
                  height10.pOnly(top: 1),
                  Obx(() => CustomButton(
                        index: 5,
                        buttonName: '규칙목록',
                        icon: Icons.rule,
                        route: '/rules',
                        isSingleAction: false,
                        screenWidth: sideMenuWidth,
                        isSelected: controller.selectedIndex.value == 5,
                        onTap: () {
                          _toggleMenu(5);
                          _onButtonTap(5, '/rules');
                        },
                      )),
                ],
              ).pOnly(top: 70, left: 30, right: 30),
            ),
            Expanded(
              child: Container(
                height: screen.width,
                decoration: const BoxDecoration(
                  color: adminMainBackgroundColor,
                ),
                child: Obx(() => _buildContent()),
              ).pOnly(top: 40, left: 40, right: 40),
            ),
          ],
        ),
      ),
    );
  }
}
