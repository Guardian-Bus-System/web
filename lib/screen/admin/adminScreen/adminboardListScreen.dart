import 'dart:convert';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/model/admin/Reservation.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminMiddleWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminTitleWidget.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class AdminBoardListScreen extends StatefulWidget {
  const AdminBoardListScreen({Key? key}) : super(key: key);

  @override
  State<AdminBoardListScreen> createState() => _AdminBoardListScreenState();
}

class _AdminBoardListScreenState extends State<AdminBoardListScreen> {
  bool isCheckedAll = false;
  List<bool> isCheckedList = [];
  String? _selectedBusNumber = 'all';
  List<AdminReservation> reservations = [];
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
        reservations = (json.decode(utf8.decode(response.bodyBytes))['data'] as List)
            .map((data) => AdminReservation.fromJson(data))
            .toList();
        isCheckedList = List<bool>.filled(reservations.length, false);
      });
    } else {
      throw Exception('Failed to load reservations');
    }
  }

  Future<void> fetchAllReservations() async {
    final response = await http.get(Uri.parse('${ApiEndPoints.adminBaseUrl}/reservations'));
    if (response.statusCode == 200) {
      setState(() {
        reservations = (json.decode(utf8.decode(response.bodyBytes))['data'] as List)
            .map((data) => AdminReservation.fromJson(data))
            .toList();
        isCheckedList = List<bool>.filled(reservations.length, false);
      });
    } else {
      throw Exception('Failed to load all reservations');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return Column(
      children: [
        //제목 컨테이너
        TitleWidget(title: '학생 탑승 내역').pOnly(bottom: 35),

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

        //학생 목록
        Container(
          width: screen.width,
          height: screen.height * 0.7,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  '학번'.text.xl.bold.make().pOnly(left: 38),
                  '이름'.text.xl.bold.make().pOnly(left: 79),
                  '탑승 호차'.text.xl.bold.make().pOnly(left: 90),
                  '도착지'.text.xl.bold.make().pOnly(left: 80)
                ],
              ),
              Container(
                width: screen.width,
                height: 1,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Color.fromARGB(255, 163, 163, 163))),
              ).pOnly(top: 10, bottom: 10),

              // 학생 목록
              SizedBox(
                width: screen.width,
                height: screen.height * 0.535,
                child: ListView.builder(
                  itemCount: reservations.length,
                  itemBuilder: (context, index) {
                    final reservation = reservations[index];
                    final user = reservation.user;
                    final busInfo = reservation.busInfo;
                    return Column(
                      children: [
                        Row(
                          children: [
                            '${extractNumbers(user.gradeClass)}${user.number < 9 ? '0${user.number}' : '${user.number}'}'
                                .text
                                .xl
                                .make()
                                .pOnly(left: 40),
                            user.name.text.xl.make().pOnly(left: 75),
                            '${busInfo.busNumber}호차'.text.xl.make().pOnly(left: 95),
                            reservation.endCity.text.xl.make().pOnly(left: 80),
                          ],
                        ).pOnly(bottom: 35),
                      ],
                    );
                  },
                ),
              ).pOnly(top: 20),
            ],
          ).p(20),
        )
      ],
    );
  }
}
