import 'package:flutter/material.dart';

class NotificationListContainer extends StatefulWidget {
  const NotificationListContainer({super.key});

  @override
  State<NotificationListContainer> createState() => _NotificationListContainerState();
}

class _NotificationListContainerState extends State<NotificationListContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ListView(),
        )
      ],
    );
  }
}