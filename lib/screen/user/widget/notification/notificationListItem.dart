import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/model/NoticesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationListItem extends StatefulWidget {
  final Notice notice;

  const NotificationListItem({super.key, required this.notice});

  @override
  _NotificationListItemState createState() => _NotificationListItemState();
}

class _NotificationListItemState extends State<NotificationListItem> {

  @override
  void initState() {
    super.initState();

    print(widget.notice.title);
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return InkWell(
      onTap: () {
        Get.toNamed('/notification/detail');
      },
      child: Column(
        children: [
          const Divider(),
          SizedBox(
            width: screen.width - 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.notice.title.text.size(FontSiz16).make(),
                Text(
                  '2024-04-29',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ).pOnly(top: 20, bottom: 19, left: 25),
        ],
      ),
    );
  }
}
