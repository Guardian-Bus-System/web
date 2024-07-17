import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class StudentBusItemWidget extends StatelessWidget {
  final int busNumber;

  const StudentBusItemWidget({Key? key, required this.busNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 170,
          height: 45,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 67, 140, 251),
            border: Border.all(
              color: Color.fromARGB(255, 217, 217, 217),
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              '${busNumber + 1}호차',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18, // xl2
              ),
            ),
          ),
        ),
        Container(
          width: 170,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 217, 217, 217),
              width: 1
            )
          ),
          child: ListView(
            children: List<int>.generate(9, (studentNum) => studentNum)
                .map((studentNum) => Container(
                      child: Center(
                        child: Text(
                          '${studentNum + 1} 홍길동',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18, // xl2
                          ),
                        ).pOnly(top:3, bottom:3),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
