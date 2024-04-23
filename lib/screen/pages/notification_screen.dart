import 'package:capstone_front/screen/widget/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/widget/notification/notificationContainer.dart';
import 'package:flutter/material.dart';
import 'package:capstone_front/screen/widget/custom_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
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
