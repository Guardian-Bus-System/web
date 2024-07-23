import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/controller/userController/notices_controller.dart';
import 'package:capstone_front/model/NoticesModel.dart';
import 'package:capstone_front/screen/admin/widget/adminHome/header_widget.dart';
import 'package:capstone_front/screen/user/widget/loadingAction.dart';
import 'package:capstone_front/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminMainNotices extends StatefulWidget {
  const AdminMainNotices({super.key});

  @override
  State<AdminMainNotices> createState() => _AdminMainNoticesState();
}

class _AdminMainNoticesState extends State<AdminMainNotices> {
  final NoticeController noticeController = Get.put(NoticeController());

  final RxList<Notice> notices = <Notice>[].obs;

  @override
  void initState() {
    super.initState();
    //_getNotices();
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
    ScreenSize screen = ScreenSize(context);

    return Container(
      width: screen.width,
      height: screen.height * 0.2109,
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
      child: Container(
        width: screen.width,
        height: screen.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(title: '공지사항', onPressed: () {},),
            
            Expanded(
              child: Obx(() {
                if (notices.isEmpty) {
                  return const LoadingProgressIndecatorWidget();
                }

                return ListView(
                  children: List<int>.generate(2, (index) => index)
                    .map((index) => 
                      Stack(
                        children: [
                          Positioned(
                            left: 0,top: 11,
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(color: black, borderRadius: BorderRadius.circular(5))
                            )
                          ),
                          '${notices[index].content}'.text.xl2.make().pOnly(left: 15),
                        ],
                      )
                    )
                    .toList(),
                );
              })
            )
          ],
        ).pSymmetric(h:20, v:20),
      )
    );
  }
}
