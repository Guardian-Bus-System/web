import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/user/pages/changeBusRoute_screen.dart';
import 'package:capstone_front/screen/user/pages/home_screen.dart';
import 'package:capstone_front/screen/user/pages/notification_screen.dart';
import 'package:capstone_front/screen/user/pages/rule_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/user/pages/profile_screen.dart';

class MainViewTabController extends GetxController {
  var index = 2.obs;

  void setTabIndex(int tabIndex) {
    index.value = tabIndex;
  }

  void goToTabItem(TabItem tabItem) {
    index.value = tabItem.index;
  }
}

enum TabItem { notice, busRoute, home, profile, rule }

class MainView extends StatelessWidget {
  final MainViewTabController _tabController = Get.put(MainViewTabController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: IndexedStack(
            index: _tabController.index.value,
            children: [
              const NotificationScreen(),
              const ChangeBusRouteScreen(),
              const HomeScreen(),
              ProfileScreen(),
              const RuleScreen(),
            ],
          ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabController.index.value,
        selectedItemColor: baseColor,
        onTap: (index) {
          _tabController.setTabIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map, size: 20),
            label: '공지',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, size: 20),
            label: '버스경로',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 20),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum, size: 20),
            label: '프로필',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, size: 20),
            label: '규칙',
          ),
        ],
      ),
    ));
  }
}
