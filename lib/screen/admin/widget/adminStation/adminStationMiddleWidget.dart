import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminAliginButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminStationMiddleWidget extends StatefulWidget {
  @override
  State<AdminStationMiddleWidget> createState() =>
      _AdminStationMiddleWidgetState();
}

class _AdminStationMiddleWidgetState extends State<AdminStationMiddleWidget> {
  String? _selectedSubMenu;

  void _onMenuItemTap(Map<String, String> item) {
    setState(() {
      _selectedSubMenu = item['text'];
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return SizedBox(
      width: screen.width,
      height: screen.height * 0.07,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AliginWidget(
                    menuItems: const [
                      {'text': '지명', 'route': ''},
                      {'text': '마을', 'route': ''},
                      {'text': '상세정보', 'route': ''},
                    ],
                    screenWidth: screen.width,
                    onMenuItemTap: _onMenuItemTap,
                    selectedSubMenu: _selectedSubMenu,
                  ),
                ],
              ),
              TextButton(onPressed: () {}, child: '저장'.text.xl.make())
            ],
          ),
        ],
      ),
    );
  }
}
