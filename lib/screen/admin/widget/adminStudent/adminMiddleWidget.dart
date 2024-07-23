import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminStudentSearchWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminAliginButtonWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminDropdownWidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminMiddleWidget extends StatefulWidget {
  @override
  State<AdminMiddleWidget> createState() => _AdminMiddleWidgetState();
}

class _AdminMiddleWidgetState extends State<AdminMiddleWidget> {
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
      height: screen.height * 0.1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  '정렬'.text.bold.xl.make().pOnly(right: 35),
                  AliginWidget(
                    menuItems: const [
                      {'text': '오름차순', 'route': ''},
                      {'text': '내림차순', 'route': ''},
                    ],
                    screenWidth: screen.width,
                    onMenuItemTap: _onMenuItemTap,
                    selectedSubMenu: _selectedSubMenu,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    child: AlertDropdownButton().pOnly(right: 20),
                  ),
                  SearchWidget(),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            // You may want to add child or other properties here if needed
          ).pOnly(left: 20),
        ],
      ),
    );
  }
}
