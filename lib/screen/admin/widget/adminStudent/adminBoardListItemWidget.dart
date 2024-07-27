import 'package:capstone_front/model/ReservationModel.dart';
import 'package:capstone_front/model/admin/Reservation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminBoardListItemWidget extends StatelessWidget {
  final AdminReservation reservation;
  final AdminUser user;
  final AdminBusInfo busInfo;
  
  const AdminBoardListItemWidget({super.key, required this.user, required this.busInfo, required this.reservation});

  @override
  Widget build(BuildContext context) {
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
  }
}