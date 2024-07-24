import 'dart:convert';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/screen/admin/widget/adminHome/header_widget.dart';
import 'package:capstone_front/screen/admin/widget/student_busItem_widget.dart';
import 'package:capstone_front/screen/user/widget/loadingAction.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class AdminMainStudent extends StatefulWidget {
  const AdminMainStudent({super.key});

  @override
  _AdminMainStudentState createState() => _AdminMainStudentState();
}

class _AdminMainStudentState extends State<AdminMainStudent> {
  RxList<Map<String, dynamic>> buses = <Map<String, dynamic>>[].obs;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // fetchBuses();
  }

  Future<void> fetchBuses() async {
    final response = await http.get(Uri.parse(
        ApiEndPoints.adminBaseUrl + ApiEndPoints.authEndPoints.userBusApi));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      buses.value = List<Map<String, dynamic>>.from(data['data']);
    } else {
      print('admin buss not undifinde');
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return Container(
      width: screen.width * 0.4687,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Theme(
        data: ThemeData(
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(title: '학생 목록', onPressed: () {}),
              SizedBox(
                  width: screen.width * 0.63,
                  height: screen.height * 0.6705,
                  child: Obx(() {
                    if (buses.isEmpty) {
                      return const Center(
                          child: LoadingProgressIndecatorWidget());
                    }
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: buses
                          .map((bus) => StudentBusItemWidget(
                                busNumber: bus['busNumber'],
                                id: bus['id'],
                              ))
                          .toList(),
                    );
                  })),
            ],
          ).pOnly(top: 20, left: 20, right: 20),
        ),
      ),
    );
  }
}
