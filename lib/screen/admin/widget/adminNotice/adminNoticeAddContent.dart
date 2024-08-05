// screen/admin/AdminStudentListScreen.dart
import 'package:capstone_front/controller/userController/user_controller.dart';
import 'package:capstone_front/model/admin/Student.dart';
import 'package:capstone_front/screen/admin/widget/adminNotice/adminNoticeEditTitle.dart';
import 'package:capstone_front/screen/admin/widget/adminRowAddButtonWidget.dart';
import 'package:capstone_front/screen/user/widget/loadingAction.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:capstone_front/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:http/http.dart' as http;

class AdminNoticeAddContent extends StatefulWidget {
  final String screenTitle;
  final String fButtonText;
  final String sButtonText;
  final VoidCallback sOnPressed;
  var notice;

  AdminNoticeAddContent({
    super.key, 
    required this.screenTitle, 
    required this.fButtonText,
    required this.sButtonText, 
    required this.sOnPressed,
    this.notice
  });

  @override
  State<AdminNoticeAddContent> createState() => _AdminNoticeAddContentState();
}

class _AdminNoticeAddContentState extends State<AdminNoticeAddContent> {
  UserController userController = Get.put(UserController());
  bool isCheckedAll = false;
  List<bool> isCheckedList = [];
  List<StudentUser> students = [];
  List<String> selectedStudentIds = [];

  @override
  void initState() {
    super.initState();
    //_getData();
  }

  Future<void> deleteSelectedStudents() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('token');

    if (await checkTokens()) {
      if (selectedStudentIds.isEmpty) return;

      for (String id in selectedStudentIds) {
        var url = Uri.parse(ApiEndPoints.adminBaseUrl + '/users/$id');
        var headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        };

        final response = await http.delete(url, headers: headers);
        print(response.statusCode);
        if (response.statusCode == 200) {
          print('Deleted student with ID: $id');
        } else {
          print('Failed to delete student with ID: $id');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return Column(
      children: [
        AdminNoticeEditTitleWidget(
          title: widget.screenTitle,
          fButtonText: widget.fButtonText,
          sButtonText: widget.sButtonText,
          fonPressed: () async {

          },
          cancel: widget.sOnPressed,
        ),
        Container(
          width: screen.width,
          height: screen.height * 0.7,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              //인풋 창
            ],
          ).p(20),
        )
      ],
    );
  }
}
