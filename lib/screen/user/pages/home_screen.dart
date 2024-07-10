import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/controller/userController/notices_controller.dart';
import 'package:capstone_front/model/NoticesModel.dart';
import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/model/data.dart';
import 'package:capstone_front/screen/user/widget/bus/busList_container.dart';
import 'package:capstone_front/screen/user/widget/bus/busUserInfo_container.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/scrolling_text.dart';
import 'package:capstone_front/screen/user/widget/customHomeAppbarWidget.dart';
import 'package:capstone_front/screen/user/widget/drawer_widget.dart';
import 'package:capstone_front/screen/user/widget/loadingAction.dart';
import 'package:capstone_front/screen/user/widget/notification/notification.dart';
import 'package:capstone_front/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/userController/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController userController = Get.put(UserController());
  final NoticeController noticeController = Get.put(NoticeController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final RxList<Notice> notices = <Notice>[].obs;
  late Rx<User> userdata = USERDATA;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    FlutterLocalNotification.init();
    await FlutterLocalNotification.requestNotificationPermission();
    await _getData();
  }

  Future<void> _getData() async {
    if (await checkTokens()) {
      UserResponse userResponse = await userController.getUserData();
      userdata.value = userResponse.data;

      NoticeResponse noticeResponse = await noticeController.getNotices();
      notices.value = noticeResponse.data.content;
    }
  }
  
  @override
  void dispose() {
    Get.delete<UserController>();
    Get.delete<NoticeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return Obx(() {
      if (userdata.value.id.isEmpty) {
        return const LoadingProgressIndecatorWidget();
      }
      return Scaffold(
        key: _scaffoldKey,
        endDrawer: DrawerWidget(user: userdata),
        body: Container(
          color: backgroundColor,
          child: Center(
            child: Column(
              children: [
                CustonHomeAppbarWidget(scaffoldKey: _scaffoldKey),
                const Divider(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed('/notification');
                            FlutterLocalNotification.showNotification();
                          },
                          child: Obx(() {
                            String noticeText = '새로운 공지가 있습니다';
                            if (notices.isNotEmpty) {
                              noticeText = '새로운 공지가 있습니다 - ${notices[0].content}';
                            }
                            return ScrollingTextWidget(moveText: noticeText);
                          }),
                        ),
                        height25,
                        BusUserInfoContainer(
                          containerWidth: screen.width - 50,
                          containerHeight: screen.height,
                          user: userdata,
                        ),
                        BusListContainer(
                          listItemWidth: screen.width - 50,
                          listItemHeight: screen.height,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
