import 'dart:convert';
import 'package:capstone_front/model/admin/Student.dart';
import 'package:capstone_front/screen/admin/widget/AdminLine.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminMiddleWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminStudentRowControllWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminTitleWidget.dart';
import 'package:capstone_front/screen/user/widget/loadingAction.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:http/http.dart' as http;

class AdminStudentListScreen extends StatefulWidget {
  const AdminStudentListScreen({Key? key}) : super(key: key);

  @override
  State<AdminStudentListScreen> createState() => _AdminStudentListScreenState();
}

class _AdminStudentListScreenState extends State<AdminStudentListScreen> {
  bool isCheckedAll = false;
  List<bool> isCheckedList = [];
  final String _selectedSortOrder = '오름차순';
  String? _selectedBusNumber = 'all';
  List<Student> students = [];
  List<dynamic> busList = [];

  @override
  void initState() {
    super.initState();
    //fetchBuses();
    //fetchAllReservations();
  }

  Future<void> fetchBuses() async {
    final response = await http.get(Uri.parse(ApiEndPoints.adminBaseUrl + '/buses'));
    if (response.statusCode == 200) {
      setState(() {
        busList = json.decode(utf8.decode(response.bodyBytes))['data'];
        busList.insert(0, {'id': 'all', 'busNumber': '전체 목록'});
      });
    } else {
      throw Exception('Failed to load buses');
    }
  }

  Future<void> fetchReservations(String? busId) async {
    if (busId == 'all' || busId == null) {
      fetchAllReservations();
      return;
    }

    final response = await http.get(Uri.parse('${ApiEndPoints.adminBaseUrl}/reservations/reservation/$busId'));
    if (response.statusCode == 200) {
      setState(() {
        students = (json.decode(utf8.decode(response.bodyBytes))['data'] as List)
            .map((data) => Student.fromJson(data['user']))
            .toList();
        isCheckedList = List<bool>.filled(students.length, false);
      });
    } else {
      throw Exception('Failed to load reservations');
    }
  }

  Future<void> fetchAllReservations() async {
    final response = await http.get(Uri.parse('${ApiEndPoints.adminBaseUrl}/reservations'));
    if (response.statusCode == 200) {
      setState(() {
        students = (json.decode(utf8.decode(response.bodyBytes))['data'] as List)
            .map((data) => Student.fromJson(data['user']))
            .toList();
        isCheckedList = List<bool>.filled(students.length, false);
      });
    } else {
      throw Exception('Failed to load all reservations');
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    List<Student> sortedStudents = List.from(students);

    // 정렬 처리
    if (_selectedSortOrder == '내림차순') {
      sortedStudents.sort((a, b) => b.id.compareTo(a.id));
    } else {
      sortedStudents.sort((a, b) => a.id.compareTo(b.id));
    }

    return Column(
      children: [
        const TitleWidget(title: '학생 관리'),
        AdminMiddleWidget(
          selectedBusNumber: _selectedBusNumber,
          onBusNumberChanged: (value) {
            setState(() {
              _selectedBusNumber = value;
              fetchReservations(value);
            });
          },
          busList: busList,
        ),
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
                            });
                          },
                        ),
                      ),
                      'id'.text.xl.bold.make().pOnly(left: 40),
                      '아이디'.text.xl.bold.make().pOnly(left: 40),
                      '비밀번호'.text.xl.bold.make().pOnly(left: 105),
                      '학년'.text.xl.bold.make().pOnly(left: 125),
                      '반'.text.xl.bold.make().pOnly(left: 40),
                      '번호'.text.xl.bold.make().pOnly(left: 55),
                      '이름'.text.xl.bold.make().pOnly(left: 55),
                      '전화번호'.text.xl.bold.make().pOnly(left: 110)
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        // Handle delete action here
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
              AdminLine(),

              // 학생 목록
              SizedBox(
                width: screen.width,
                height: screen.height * 0.535,
                child: students.isEmpty
                    ? const Center(child: LoadingProgressIndecatorWidget())
                    : ListView.builder(
                        itemCount: sortedStudents.length,
                        itemBuilder: (context, index) {
                          Student student = sortedStudents[index];
                          return StudentRowControllWidget(
                            id: int.tryParse(student.id) ?? 0, // ID를 정수로 변환, 실패 시 0 사용
                            uuid: student.id,
                            username: student.loginId,
                            password: '****', // Set empty password if not used
                            grade: student.grade,
                            classNumber: student.classNumber,
                            number: student.number,
                            name: student.name,
                            phone: student.phoneNumber,
                            isChecked: isCheckedList[index],
                            onCheckboxChanged: (value) {
                              setState(() {
                                isCheckedList[index] = value ?? false;
                                isCheckedAll = isCheckedList.every((element) => element);
                              });
                            },
                            onSavePressed: () {
                              // Edit button pressed
                            },
                          );
                        },
                      ),
              )
            ],
          ).pOnly(left: 20, right: 20, top: 20, bottom: 20),
        )
      ],
    ).pOnly(left: 50, right: 50, top: 25);
  }
}
