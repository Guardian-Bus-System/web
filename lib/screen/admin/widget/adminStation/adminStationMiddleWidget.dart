import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminAliginButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart'; // GetX 패키지 임포트

class AdminStationRouteController extends GetxController {
  var currentRoute = '/bus/item2'.obs;
}

class AdminStationMiddleWidget extends StatelessWidget {
  final Function(String) onMenuItemTap;

  AdminStationMiddleWidget({required this.onMenuItemTap});

  final AdminStationRouteController controller = Get.put(AdminStationRouteController()); // 의존성 주입

  void _handleMenuItemTap(Map<String, String> item) {
    controller.currentRoute.value = item['route']!;
    onMenuItemTap(item['route']!); // 메뉴 항목 클릭 시 콜백 함수 호출
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return SizedBox(
      width: screen.width,
      height: 35,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AliginWidget(
                    menuItems: const [
                      {'text': '지명', 'route': '/bus/item2'},
                      {'text': '마을', 'route': '/bus/item3'},
                      {'text': '상세정보', 'route': '/bus/item4'},
                    ],
                    screenWidth: screen.width,
                    onMenuItemTap: _handleMenuItemTap,
                    selectedSubMenu: controller.currentRoute.value,
                  ),
                ],
              ),
              TextButton(
                onPressed: () {}, 
                child: '저장'.text.xl.black.bold.make(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
