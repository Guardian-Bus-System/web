import 'package:flutter/material.dart';
import 'notificationListItem.dart'; 

class NotificationListContainer extends StatelessWidget {
  const NotificationListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(20, (index) => NotificationListItem()),
      ),
    );
  }
}
