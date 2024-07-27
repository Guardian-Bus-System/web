import 'package:capstone_front/controller/adminController/adminStudent_controller.dart';
import 'package:capstone_front/screen/user/widget/loadingAction.dart';
import 'package:flutter/material.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/model/admin/Reservation.dart';
import 'package:capstone_front/screen/admin/widget/AdminLine.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminBoardListItemWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminMiddleWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminTitleWidget.dart';// Import the controller
import 'package:get/get_state_manager/get_state_manager.dart';
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
  final AdminBoardListController _controller = AdminBoardListController();

  @override
  void initState() {
    super.initState();
    //_loadInitialData();
  }

  Future<void> _loadInitialData() async {
    try {
      busList = await _controller.fetchBuses();
      await _updateReservations();
    } catch (e) {
      // Handle errors as needed
      print(e);
    }
  }

  Future<void> _updateReservations() async {
    try {
      reservations = await _controller.fetchReservations(_selectedBusNumber);
      isCheckedList = List<bool>.filled(reservations.length, false);
      setState(() {});
    } catch (e) {
      // Handle errors as needed
      print(e);
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
              _updateReservations();
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
                child: reservations.isEmpty 
                  ? const Center(child: LoadingProgressIndecatorWidget())
                  : ListView.builder(
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
                    )
                
              ).pOnly(top: 20),
            ],
          ).p(20),
        )
      ],
    );
  }
}
