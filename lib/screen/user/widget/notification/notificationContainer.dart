import 'package:capstone_front/controller/userController/notices_controller.dart';
import 'package:capstone_front/model/NoticesModel.dart';
import 'package:capstone_front/screen/user/widget/loadingAction.dart';
import 'package:capstone_front/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'notificationListItem.dart';

class NotificationListContainer extends StatefulWidget {
  const NotificationListContainer({Key? key}) : super(key: key);

  @override
  _NotificationListContainerState createState() =>
      _NotificationListContainerState();
}

class _NotificationListContainerState extends State<NotificationListContainer> {
  final NoticeController noticeController = Get.put(NoticeController());

  final RxList<Notice> notices = <Notice>[].obs;

  @override
  void initState() {
    super.initState();
    _getNotices();
  }

  Future<void> _getNotices() async {
    if (await checkTokens()) {
      NoticeResponse noticeResponse = await noticeController.getNotices();
      notices.value = noticeResponse.data.content;
    }
  }

  @override
  void dispose() {
    Get.delete<NoticeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (notices.isEmpty) {
        return const LoadingProgressIndecatorWidget();
      }

      return ListView.builder(
        itemCount: notices.length,
        itemBuilder: (context, index) {
          return NotificationListItem(
            notice: notices[index],
            id: notices[index].id,
          );
        },
      );
    });
  }
}
