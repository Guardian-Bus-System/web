import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/controller/userController/notices_controller.dart';
import 'package:capstone_front/model/NoticesModel.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/formatter.dart';
import 'package:capstone_front/screen/user/widget/notification/notificationDetailWidget.dart';
import 'package:capstone_front/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationListItem extends StatefulWidget {
  final Notice notice;
  final int id;

  const NotificationListItem({super.key, required this.notice, required this.id});

  @override
  _NotificationListItemState createState() => _NotificationListItemState();
}

class _NotificationListItemState extends State<NotificationListItem> {
  final NoticeController noticeController = Get.put(NoticeController());

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    final contentWidget = widget.notice.content?.text.size(FontSiz16).make() ?? SizedBox.shrink();

    return Stack(
      children: [
        if(widget.notice.views) Positioned(
          top: 15,left: 0,
          child: Container(
            width: screen.width,
            height: screen.height,
            color:  Colors.grey[200],
          )
        ),
        InkWell(
          onTap: () async {
            if (await checkTokens()) {
              await noticeController.checkNoticeDetails(widget.id);
              Get.to(NotificationDetailWidget(noticeText: '${widget.notice.content}', dateTime: formatDateTime('${widget.notice.createAt}'),));
            }
          },
          child: Column(
            children: [
              const Divider(),
              SizedBox(
                width: screen.width - 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    contentWidget, // content가 null일 경우 빈 위젯 반환
                    Text(
                      formatDateTime('${widget.notice.createAt}'), // DateTime 출력
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ).pOnly(top: 20, bottom: 19, left: 25),
            ],
          ),
        ),
      ],
    );
  }
}
