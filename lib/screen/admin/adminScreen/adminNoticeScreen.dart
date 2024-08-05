// screen/admin/AdminStudentListScreen.dart

import 'dart:convert';
import 'package:capstone_front/controller/userController/user_controller.dart';
import 'package:capstone_front/model/admin/Student.dart';
import 'package:capstone_front/screen/admin/widget/AdminLine.dart';
import 'package:capstone_front/screen/admin/widget/adminRowAddButtonWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminMiddleWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminStudentRowControllWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminTitleWidget.dart';
import 'package:capstone_front/screen/user/widget/loadingAction.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:capstone_front/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:http/http.dart' as http;

class AdminNoticesScreen extends StatefulWidget {
  const AdminNoticesScreen({Key? key}) : super(key: key);

  @override
  State<AdminNoticesScreen> createState() => _AdminNoticesScreenState();
}

class _AdminNoticesScreenState extends State<AdminNoticesScreen> {
  UserController userController = Get.put(UserController());
  bool isCheckedAll = false;
  List<bool> isCheckedList = [];
  final String _selectedSortOrder = '오름차순';
  String _searchQuery = '';
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


  void _updateSelectedIds() {
    selectedStudentIds = [];
    for (int i = 0; i < isCheckedList.length; i++) {
      if (isCheckedList[i]) {
        selectedStudentIds.add(students[i].id);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    List<StudentUser> filteredStudents = students.where((student) {
      return student.name.contains(_searchQuery);
    }).toList();

    List<StudentUser> sortedStudents = List.from(filteredStudents);


    return Column(
      children: [
        const TitleWidget(title: '공지 목록'),
        Container(
          width: screen.width,
          height: screen.height * 0.7,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black)),
                        child: Checkbox(
                          checkColor: Colors.black,
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: isCheckedAll,
                          onChanged: (value) {
                            setState(() {
                              isCheckedAll = value ?? false;
                              isCheckedList = List<bool>.filled(
                                  isCheckedList.length, isCheckedAll);
                              _updateSelectedIds();
                            });
                          },
                        ),
                      ),
                      'id'.text.xl.bold.make().pOnly(left: 40),
                      '내용'.text.xl.bold.make().pOnly(left: 107),
                      '태그'.text.xl.bold.make().pOnly(left: 155),
                      '업로드 날짜'.text.xl.bold.make().pOnly(left: 125),
                      '수정 날짜'.text.xl.bold.make().pOnly(left: 40),
                      '조회수'.text.xl.bold.make().pOnly(left: 55),
                    ],
                  ),
                  if (selectedStudentIds.isNotEmpty) // 삭제 버튼의 가시성 조정
                    TextButton(
                      onPressed: () async {
                        // 선택된 학생들을 삭제합니다.
                        await deleteSelectedStudents();
                      },
                      child: Container(
                        width: 75,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 236, 82, 82),
                            borderRadius: BorderRadius.circular(5)),
                        child: '삭제'.text.white.center.xl.make().pOnly(top: 3),
                      ))
                ],
              ),
              const AdminLine(),
              // 학생 목록
              SizedBox(
                width: screen.width,
                height: screen.height * 0.535,
                child: students.isEmpty
                    ? const Center(child: LoadingProgressIndecatorWidget())
                    : ListView.builder(
                        itemCount: sortedStudents.length,
                        itemBuilder: (context, index) {
                          StudentUser student = sortedStudents[index];
                          return StudentRowControllWidget(
                            id: int.tryParse(student.id) ?? 0, // ID를 정수로 변환, 실패 시 0 사용
                            uuid: student.id,
                            username: student.loginId,
                            password: '****', // Set empty password if not used
                            grade: student.grade,
                            classNumber: student.classNumber, // Extract class number from gradeClass if necessary
                            number: student.number,
                            name: student.name,
                            phone: student.phoneNumber,
                            isChecked: isCheckedList[index],
                            onCheckboxChanged: (value) {
                              setState(() {
                                isCheckedList[index] = value ?? false;
                                _updateSelectedIds();
                                isCheckedAll = isCheckedList.every((element) => element);
                              });
                            }
                          );
                        },
                      ),
              ).pOnly(top: 20),
              
              //추가 버튼 위젯
              AdminRowAddButtonWidget(onPressed: () {},)
            ],
          ).p(20),
        )
      ],
    );
  }
}
