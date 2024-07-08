import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/controller/userController/user_bus_controller.dart';
import 'package:capstone_front/model/BusModel.dart';
import 'package:capstone_front/screen/user/widget/bus/busListItem_widget.dart';
import 'package:capstone_front/utils/auth_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class BusListContainer extends StatefulWidget {
  final double listItemWidth;
  final double listItemHeight;

  const BusListContainer({super.key, required this.listItemWidth, required this.listItemHeight});

  @override
  State<BusListContainer> createState() => _BusListContainerState();
}

class _BusListContainerState extends State<BusListContainer> {

  UserBusListController userBusInfoController = UserBusListController();

  late RxList<UserBus> userBusList = <UserBus>[].obs;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _getData() async {
    if (await checkTokens()) {
      UserBusListResponse userBusResponse = await userBusInfoController.getUserBusListInfo();
      userBusList.value = userBusResponse.data;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          '버스목록'.text.size(FontSiz18).make().pOnly(left: 15)
        ]),
        height15,
        Obx(() {
          if (userBusList.isEmpty) {
            return const Center(child: Text("버스 정보가 없습니다."));
          }
          return SizedBox(
            width: widget.listItemWidth,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: userBusList.length,
              itemBuilder: (BuildContext context, int index) {
                return BusListItemWidget(
                  userBusInfo: userBusList[index],
                  listItemHeight: 70,
                  listItemWidth: widget.listItemWidth,
                );
              },
            ),
          );
        }),
      ],
    ).pOnly(left: 10);
  }
}