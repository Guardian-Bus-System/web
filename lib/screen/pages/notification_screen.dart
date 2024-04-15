import 'package:capstone_front/screen/widget/custom_appbar.dart';
import 'package:capstone_front/screen/widget/notification/notificationContainer.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CustomAppBar(
          appBarTitle: '공지사항',
        ),
      ),
      body: NotificationListContainer(),
    );
  }
}