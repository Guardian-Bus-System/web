import 'package:capstone_front/controller/userController/busInfo_controller.dart';
import 'package:capstone_front/model/ReservationModel.dart';
import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class BusUserInfo extends StatefulWidget {
  final Rx<User> user;
  final double containerWidth;
  final double containerHeight;

  const BusUserInfo({super.key, required this.user, required this.containerWidth, required this.containerHeight});

  @override
  State<BusUserInfo> createState() => _BusUserInfoState();
}

class _BusUserInfoState extends State<BusUserInfo> {
  UserBusInfoController userBusInfoController = UserBusInfoController();
  late RxList<ReservationData> busInfo = <ReservationData>[].obs;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    ReservationResponse reservationData = await userBusInfoController.getUserBusInfo();
    if (reservationData.data != null) {
      busInfo.value = [reservationData.data!];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.containerHeight,
      width: widget.containerWidth,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 0,
            blurRadius: 7.0,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Obx(() {
        if (busInfo.isEmpty) {
          // 데이터가 비어있을 때 보여줄 위젯
          return Center(child: '예약된 버스 정보가 없습니다.\n 하단에 버스경로로 가주세요.'.text.color(bacgroundOrTextColor).make());
        } else {
          // 데이터가 있을 때
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      '${widget.user.value.gradeClass
                      }${widget.user.value.number > 9 
                        ? widget.user.value.number
                        : '0${widget.user.value.number}'} ${widget.user.value.name}'
                      .text.bold.size(FontSiz18).color(bacgroundOrTextColor).make(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      '${busInfo[0].busInfo.busNumber}'.text.color(bacgroundOrTextColor).size(FontSiz12 * 4).make(),
                      '호차'.text.size(FontSiz18).color(bacgroundOrTextColor).make().pOnly(top:15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 189,
                            child: Text(
                              '${busInfo[0].busInfo.busName}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: FontSiz15,
                                color: bacgroundOrTextColor,
                              ),
                              overflow: TextOverflow.ellipsis, // 말줄임표 설정
                              maxLines: 1, // 한 줄로 제한
                            ),
                          ),
                          SizedBox(
                            width: 194,
                            child: busInfo[0].endCity.text.size(FontSiz13).align(TextAlign.center).color(bacgroundOrTextColor).make(),
                          )
                        ],
                      ).pOnly(left: 55)
                    ],
                  ),
                ],
              )
            ],
          ).pOnly(left: 15, right: 15, top: 10);
        }
      }),
    );
  }
}
