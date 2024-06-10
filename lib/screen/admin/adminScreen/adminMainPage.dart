import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/admin/widget/adminMenuButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  int _selectedIndex = 1; 
  String? _selectedSubMenu; 

  void _toggleMenu(int index) {
    setState(() {
      _selectedIndex = _selectedIndex == index ? -1 : index; // Toggle the selected index
      _selectedSubMenu = null; // Reset the selected sub-menu item when a new menu is opened
    });
  }

  void _onMenuItemTap(String route, String text) {
    setState(() {
      _selectedSubMenu = text; // Update the selected sub-menu item
    });
    //Navigator.pushNamed(context, route);
  }

  void _onButtonTap(int index, String route) {
    setState(() {
      _selectedIndex = index; // Update selected button index
    });
    // Navigate to the selected route
    //Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);
    WhiteSpaceSize spaceSize = WhiteSpaceSize(context);

    final sideMenuWidth = screen.width * 0.2;

    return Scaffold(
      body: Row(
        children: [
          Container( // Side Menu 
            color: adminNavigationColor,
            width: sideMenuWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildButton(1, '홈', Icons.home_outlined, '/admin/home', false, sideMenuWidth),
                height10.pOnly(top: 1),
                _buildButton(2, '공지사항', Icons.notification_add_outlined, '', true, sideMenuWidth),
                if (_selectedIndex == 2) ...[
                  height20,
                  _buildMenuWidget([
                    {'text': '공지 목록', 'route': '/notice/item1'},
                    {'text': '공지 등록', 'route': '/notice/item2'},
                  ], screen.width),
                ],
                height10.pOnly(top: 1),
                _buildButton(3, '학생목록', Icons.people_alt_outlined, '', true, sideMenuWidth),
                if (_selectedIndex == 3) ...[
                  height20,
                  _buildMenuWidget([
                    {'text': '학생 관리', 'route': '/students/item1'},
                    {'text': '학생 탑승 내역', 'route': '/students/item2'},
                    {'text': '학생 관리자 관리', 'route': '/students/item2'},
                  ], screen.width),
                ],
                height10.pOnly(top: 1),
                _buildButton(4, '버스목록', Icons.bus_alert_outlined, '/bus', false, sideMenuWidth),
                height10.pOnly(top: 1),
                _buildButton(5, '규칙목록', Icons.rule, '/rules', false, sideMenuWidth),
              ],
            ).pOnly(top: 70, left: spaceSize.spaceW30, right: spaceSize.spaceW30),
          ),

          Container(
            width: screen.width - (sideMenuWidth * 1.3),
            height: screen.height,

            decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 10)),

            child: Column(
              children: [
                Container(
                  width: screen.width,
                  height: screen.height * 0.2109,
            decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 10)),
                )
              ],
            ),
          ).pSymmetric(v: 71, h: spaceSize.spaceW50)
        ],
      ),
    );
  }

  Widget _buildButton(int index, String buttonName, IconData icon, String route, bool isSingleAction, double screenWidth) {
    bool isSelected = _selectedIndex == index;
    
    return ButtonWidget(
      width: screenWidth - 0.03125,
      onTap: () {
        if (isSingleAction) {
          _onButtonTap(index, route);
        } else {
          _toggleMenu(index);
        }
      },
      color: isSelected ? Colors.white : Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: isSelected ? Colors.black : Colors.white).pSymmetric(h: 15),
          buttonName.text.color(isSelected ? Colors.black : Colors.white).size(20).make()
        ],
      ),
    );
  }

  Widget _buildMenuWidget(List<Map<String, String>> menuItems, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: menuItems.map((item) => _buildMenuItem(item, screenWidth)).toList(),
    );
  }

  Widget _buildMenuItem(Map<String, String> item, double screenWith) {
    bool isSelected = _selectedSubMenu == item['text'];

    return InkWell(
      onTap: () => _onMenuItemTap(item['route']!, item['text']!),
      child: Text(
        item['text']!,
        style: TextStyle(
          color: Colors.white,
          fontSize: FontSiz18,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ).pOnly(bottom: 15, left: screenWith * 0.03125),
    );
  }
}