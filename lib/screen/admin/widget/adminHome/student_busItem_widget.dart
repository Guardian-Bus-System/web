import 'dart:convert';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/user/widget/loadingAction.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class StudentBusItemWidget extends StatefulWidget {
  final int busNumber;
  final int id;

  const StudentBusItemWidget({Key? key, required this.busNumber, required this.id}) : super(key: key);

  @override
  _StudentBusItemWidgetState createState() => _StudentBusItemWidgetState();
}

class _StudentBusItemWidgetState extends State<StudentBusItemWidget> {
  List<Map<String, dynamic>> students = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    //getStudents();
  }

  Future<void> getStudents() async {
    final response = await http.get(Uri.parse(ApiEndPoints.adminBaseUrl + '/reservations/reservation/${widget.id}'));

    if (response.statusCode == 200) {
      final data = json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        students = List<Map<String, dynamic>>.from(data['data'].map((reservation) {
          final gradeClass = reservation['user']['gradeClass'];
          final gradeClassNumbers = RegExp(r'\d+').allMatches(gradeClass).map((match) => match.group(0)).toList();
          return {
            'name': reservation['user']['name'],
            'grade': gradeClassNumbers.isNotEmpty ? gradeClassNumbers[0] : '',
            'class': gradeClassNumbers.length > 1 ? gradeClassNumbers[1] : '',
            'number': reservation['user']['number'],
          };
        }));
        isLoading = false;
      });
    } else {
      // Handle error
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 133.1,
          height: 45,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 67, 140, 251),
            border: Border.all(
              color: Color.fromARGB(255, 217, 217, 217),
              width: 1,
            ),
          ),
          child: Center(
            child: '${widget.busNumber}호차'.text.color(white).bold.xl2.make()
          ),
        ),
        Container(
          width: 133.1,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 217, 217, 217),
              width: 1,
            ),
          ),
          child: isLoading
            ? const Center(child: LoadingProgressIndecatorWidget())
            : ListView(
                children: students.map((student) => 
                  SizedBox(
                    child: Center(
                      child: 
                        '${student['grade']}${student['class']}${
                        student['number'] < 9 
                          ? '0${student['number']}' 
                          : '${student['number']}'} ${
                        student['name']}'.text.bold.xl2.make().pOnly(top: 3, bottom: 3)
                    ),
                  )
                ).toList(),
              ),
        ),
      ],
    );
  }
}
