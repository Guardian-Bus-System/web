import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/routes/mainController.dart';
import 'package:capstone_front/screen/user/pages/home_screen.dart';
import 'package:capstone_front/screen/user/pages/notification_screen.dart';
import 'package:capstone_front/screen/user/pages/profile_screen.dart';
import 'package:capstone_front/screen/user/pages/rule_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CustomSide/color_theme.dart';

class HomeView extends StatelessWidget {
  final Rx<UserData> user;

  const HomeView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller.tabController,
        children: <Widget>[
          NotificationScreen(),
          HomeScreen(),
          HomeScreen(),
          ProfileScreen(user: user),
          RuleScreen(),
        ],
      ),
      bottomNavigationBar: Bottom(),
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          TabBar(
            controller: controller.tabController,
            labelColor: baseColor,
            unselectedLabelColor: Color.fromRGBO(175, 175, 175, 1),
            indicatorColor: Colors.transparent, // 선택된 탭의 배경을 표시하지 않음
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.map, size: 25),
                child: Text('공지', style: TextStyle(fontSize: 11.7)),
              ),
              Tab(
                icon: Icon(Icons.location_on, size: 25),
                child: Text('버스경로', style: TextStyle(fontSize: 11.7)),
              ),
              Tab(
                icon: Icon(Icons.home, size: 25),
                child: Text('홈', style: TextStyle(fontSize: 11.7)),
              ),
              Tab(
                icon: Icon(Icons.forum, size: 25),
                child: Text('프로필', style: TextStyle(fontSize: 11.7)),
              ),
              Tab(
                icon: Icon(Icons.account_circle, size: 25),
                child: Text('규칙', style: TextStyle(fontSize: 11.7)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
