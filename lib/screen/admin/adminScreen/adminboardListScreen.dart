import 'dart:convert';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/model/admin/Reservation.dart';
import 'package:capstone_front/screen/admin/widget/AdminLine.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminBoardListItemWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminMiddleWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminTitleWidget.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class AdminBoardListScreen extends StatefulWidget {
  const AdminBoardListScreen({super.key});

  @override
  State<AdminBoardListScreen> createState() => _AdminBoardListScreenState();
}

class _AdminBoardListScreenState extends State<AdminBoardListScreen> {
  bool isCheckedAll = false;
  List<bool> isCheckedList = [];
  String? _selectedBusNumber = 'all';
  List<AdminReservation> reservations = [];
  String _searchQuery = '';
  List<dynamic> busList = [];

  @override
  void initState() {
    super.initState();
    fetchBuses();
    fetchAllReservations();
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

  void _onSearch(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    List<AdminReservation> filteredReservations = reservations.where((reservation) {
      final user = reservation.user;
      return user.name.contains(_searchQuery) || 
             user.gradeClass.contains(_searchQuery) ||
             user.loginId.contains(_searchQuery);
    }).toList();

    return Column(
      children: [
        // 제목 컨테이너
        const TitleWidget(title: '학생 탑승 내역'),

        AdminMiddleWidget(
          selectedBusNumber: _selectedBusNumber,
          onBusNumberChanged: (value) {
            setState(() {
              _selectedBusNumber = value;
              fetchReservations(value);
            });
          },
          onSearch: _onSearch,
          busList: busList,
        ),

        // 학생 목록
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
              const AdminLine(),

              // 학생 목록
              SizedBox(
                width: screen.width,
                height: screen.height * 0.535,
                child: ListView.builder(
                  itemCount: filteredReservations.length,
                  itemBuilder: (context, index) {
                    final reservation = filteredReservations[index];
                    final user = reservation.user;
                    final busInfo = reservation.busInfo;
                    return AdminBoardListItemWidget(
                      reservation: reservation,
                      user: user,
                      busInfo: busInfo,
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
