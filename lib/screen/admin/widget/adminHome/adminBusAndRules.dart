import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
<<<<<<< HEAD
import 'package:capstone_front/controller/userController/rules_controller.dart';
import 'package:capstone_front/controller/userController/user_bus_controller.dart';
import 'package:capstone_front/model/BusModel.dart';
import 'package:capstone_front/model/RulesModel.dart';
import 'package:capstone_front/screen/admin/widget/adminHome/header_widget.dart';
import 'package:capstone_front/screen/user/widget/loadingAction.dart';
import 'package:capstone_front/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminBusAndRules extends StatefulWidget {
  const AdminBusAndRules({super.key});

  @override
  State<AdminBusAndRules> createState() => _AdminBusAndRulesState();
}

class _AdminBusAndRulesState extends State<AdminBusAndRules> {
  UserBusListController userBusInfoController = Get.put(UserBusListController());
  RulesController rulesController = Get.put(RulesController());

  late RxList<Rule> rules = <Rule>[].obs;
  late RxList<UserBus> userBusList = <UserBus>[].obs;

  @override
  void initState() {
    super.initState();
    //_getData();
  }

  Future<void> _getData() async {
    if (await checkTokens()) {
      UserBusListResponse userBusResponse = await userBusInfoController.getAdminUserBusListInfo();
      userBusList.value = userBusResponse.data;
      
      RuleResponse ruleResponse = await rulesController.getRules();
      rules.value = ruleResponse.data;
    }
  }
  
  @override
  void dispose() {
    Get.delete<UserBusListController>();
    Get.delete<RulesController>();
    super.dispose();
  }
  
  @override
=======
import 'package:capstone_front/screen/admin/widget/adminHome/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminBusAndRules extends StatelessWidget {
  const AdminBusAndRules({super.key});

  @override
>>>>>>> 896976be7360d68254617b082fdb27152952e764
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return SizedBox(
      width: screen.width * 0.25,
      child: Column(
        children: [
          //버스 목록
          Container(
<<<<<<< HEAD
            height: screen.height * 0.286,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(title: '버스 목록', onPressed: () {}),
                Expanded(
                  child: Obx(() {
                    if(userBusList.isEmpty){
                      return const Center(child: LoadingProgressIndecatorWidget());
                    }
                    return ListView(
                      children: List<int>.generate(userBusList.length, (index) => index)
                        .map((index) => 
                        '${userBusList[index].busNumber
                        }호차   ${userBusList[index].titleCityName} - ${userBusList[index].towns[0].townName}   ${
                        userBusList[index].maxTable}석'.text.xl.make().pOnly(top: 4, bottom: 1))
                      .toList(),
                    );
                  })
                )
              ],
            ).pOnly(top: 20, left: 20, right: 20)
          ),
=======
              height: screen.height * 0.286,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWidget(title: '버스 목록', onPressed: () {}),
                  Expanded(
                    child: ListView(
                      children: List<int>.generate(5, (index) => index)
                          .map((index) => '${index + 1}bus information '
                              .text
                              .xl
                              .make()
                              .pOnly(top: 4, bottom: 1))
                          .toList(),
                    ),
                  )
                ],
              ).pOnly(top: 20, left: 20, right: 20)),
>>>>>>> 896976be7360d68254617b082fdb27152952e764
          height20,
          //탑승규칙
          Container(
            height: screen.height * 0.286,
            width: screen.width,
<<<<<<< HEAD
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
=======
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
>>>>>>> 896976be7360d68254617b082fdb27152952e764
            child: Column(
              children: [
                HeaderWidget(title: '탑승규칙', onPressed: () {}),
                Expanded(
<<<<<<< HEAD
                  child: Obx(() {
                    if(rules.isEmpty){
                      return const Center(child: LoadingProgressIndecatorWidget());
                    }
                    return ListView(
                      children: List<int>.generate(rules.length, (index) => index)
                        .map((index) => 
                        '${rules[index].number}. ${rules[index].content}'.text.xl.make().pOnly(top: 4, bottom: 1))
                      .toList(),
                    );
                  })
                )
=======
                    child: ListView(
                  children: List<int>.generate(4, (index) => index)
                      .map((index) => '${index + 1}. item informaion.'
                          .text
                          .xl
                          .make()
                          .pOnly(top: 4, bottom: 1))
                      .toList(),
                ))
>>>>>>> 896976be7360d68254617b082fdb27152952e764
              ],
            ).pOnly(top: 20, left: 20, right: 20),
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 896976be7360d68254617b082fdb27152952e764
