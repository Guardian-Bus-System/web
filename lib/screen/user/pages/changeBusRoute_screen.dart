import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/controller/userController/busInfo_controller.dart';
import 'package:capstone_front/controller/userController/reservation_controller.dart';
import 'package:capstone_front/controller/userController/user_bus_controller.dart';
import 'package:capstone_front/model/BusModel.dart';
import 'package:capstone_front/model/ReservationModel.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/formatter.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/submit_button.dart';
import 'package:capstone_front/screen/user/widget/bus/busDropdownButton_widget.dart';
import 'package:capstone_front/screen/user/widget/bus/busLoadCheckButtonWidget.dart';
import 'package:capstone_front/screen/user/widget/bus/busRouteChange_container.dart';
import 'package:capstone_front/screen/user/widget/bus/busTakeButtonWidget.dart';
import 'package:capstone_front/screen/user/widget/custom_appbar.dart';
import 'package:capstone_front/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeBusRouteScreen extends StatefulWidget {
  const ChangeBusRouteScreen({super.key});

  @override
  State<ChangeBusRouteScreen> createState() => _ChangeBusRouteScreenState();
}

class _ChangeBusRouteScreenState extends State<ChangeBusRouteScreen> {
  final GlobalKey<BusDropDownButtonWidgetState> _dropDownKey =
      GlobalKey<BusDropDownButtonWidgetState>();
  UserBusInfoController userBusInfoController =
      Get.put(UserBusInfoController());
  UserBusListController userBusListController =
      Get.put(UserBusListController());
  ReservationController busCityController = Get.put(ReservationController());

  late RxList<UserBus> userBusList = <UserBus>[].obs;

  final RxInt _selectedButtonIndex = 0.obs; // 현재 선택된 버튼의 인덱스
  final RxInt _selectedBusIndex = (-1).obs; // 현재 선택된 버스 인덱스 (탑승 버튼을 클릭한 경우만 의미)

  late RxList<ReservationData> busInfo = <ReservationData>[].obs;

  @override
  void initState() {
    super.initState();
    _getBusCities();
  }

  Future<void> _getBusCities() async {
    if (await checkTokens()) {
      UserBusListResponse userBusResponse =
          await userBusListController.getUserBusListInfo();
      userBusList.value = userBusResponse.data;
      ReservationResponse reservationData =
          await userBusInfoController.getUserBusInfo();
      if (reservationData.data != null) {
        busInfo.value = [reservationData.data!];
      }
      if (reservationData.data!.onCk) {
        _selectedBusIndex.value = -1;
        _selectedButtonIndex.value = 0;
      }
    }
  }

  @override
  void dispose() {
    Get.delete<UserBusListController>();
    Get.delete<UserBusInfoController>();
    Get.delete<ReservationController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CustomAppBar(
          appBarTitle: '버스 경로 변경',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            '버스 경로 변경'.text.bold.size(FontSiz18).make(),
            height5,
            '금주 귀가주 (${getNextFridayDateFormatted()})버스 정보'
                .text
                .size(FontSiz13)
                .color(baseColor)
                .make(),
            height15,
            Obx(() {
              if (busInfo.isEmpty) {
                return '현재 탑승정보가 없습니다.'
                    .text
                    .size(FontSiz11)
                    .color(baseColor)
                    .make();
              } else {
                return '기존 탑승정보 : ${busInfo[0].busInfo.busNumber}호차 ${busInfo[0].busInfo.busName} - ${busInfo[0].endCity}'
                    .text
                    .size(FontSiz11)
                    .color(baseColor)
                    .make();
              }
            }),
            height15,
            BusRouteChangeContainer(
                containerName: '버스 탑승 여부',
                shadowBool: true,
                child: Column(
                  children: [
                    height15,
                    Obx(() => Row(
                          children: [
                            BusTakeButtonWidget(
                                buttonText: '탑승',
                                isSelected: _selectedButtonIndex == 0,
                                onTap: () {
                                  _selectedButtonIndex.value = 0;
                                  _selectedBusIndex.value = -1; // 초기화
                                }),
                            width20,
                            BusTakeButtonWidget(
                                buttonText: '미탑승',
                                isSelected: _selectedButtonIndex == 1,
                                onTap: () {
                                  _selectedButtonIndex.value = 1;
                                  _selectedBusIndex.value = -1; // 초기화
                                }),
                          ],
                        )),
                  ],
                )),
            height10,
            Obx(() => _selectedButtonIndex.value == 0
                ? BusRouteChangeContainer(
                    containerName: '도착 지역 선택',
                    shadowBool: true,
                    child: Column(
                      children: [
                        height15,
                        // UserBusList 목록을 사용하여 버튼 생성
                        Row(
                          children: [
                            Obx(
                              () => Column(
                                children:
                                    userBusList.asMap().entries.map((entry) {
                                  int index = entry.key;
                                  UserBus busCity = entry.value;
                                  return BusLoadCheckButtonWidget(
                                    busCity: busCity,
                                    dropDownKey: _dropDownKey,
                                    isSelected: _selectedBusIndex.value ==
                                        index, // 버튼이 선택되었는지 여부
                                    onTap: () {
                                      if (index >= 0 &&
                                          index < userBusList.length) {
                                        _selectedBusIndex.value =
                                            index; // 유효한 인덱스인지 확인
                                        _dropDownKey.currentState
                                            ?.updateDropdownItems(
                                                busCity); // 드롭다운 항목 업데이트
                                      }
                                    },
                                  ).pOnly(bottom: 10);
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        height15,
                        BusRouteChangeContainer(
                          containerName: '하차 지역 선택',
                          shadowBool: false,
                          child: Column(
                            children: [
                              height15,
                              BusDropDownButtonWidget(key: _dropDownKey)
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink()),
            height30,
            SubmitButton(
              onPressed: () async {
                bool isTakingBus = _selectedButtonIndex.value == 0;
                if (isTakingBus && _selectedBusIndex.value >= 0) {
                  // 탑승을 선택하고 유효한 버스가 선택된 경우
                  int busNumber = userBusList[_selectedBusIndex.value].busNumber;
                  String? selectedVillage = _dropDownKey.currentState?.selectedVillage;
                  await busCityController.sendUserReservation(
                    busNumber: busNumber,
                    selectedVillage: selectedVillage,
                  );
                }
                await busCityController.sendUserTakeBusCheck(
                    isTake: isTakingBus);
              },
              title: '신청하기')
          .pOnly(bottom: 25)
          ],
        ).pSymmetric(h: 25),
      ),
    );
  }
}
