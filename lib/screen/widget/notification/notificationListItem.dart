import 'package:capstone_front/screen/widget/notification/notificationDetailWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationListItem extends StatelessWidget {

  const NotificationListItem({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 50;

    return InkWell(
      onTap: (){
        Get.to(NotificationDetailWidget());
      },
      child: Column(
        children: [
          const Divider(),
          SizedBox(
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '오늘 3호차 10분 가량 지연될 예정',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '2024-04-29',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            )
          ).pOnly(top: 20, bottom: 19,left: 25),
        ],
      ),
    );
  }
}