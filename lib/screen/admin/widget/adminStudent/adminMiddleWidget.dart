import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminAliginButtonWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminDropdownWidget.dart';
import 'package:capstone_front/screen/admin/widget/adminStudent/adminStudentSearchWidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminMiddleWidget extends StatefulWidget {
  final void Function(String) onSearch;
  final void Function(String?)? onBusNumberChanged; // 선택적 파라미터
  final String? selectedBusNumber; // 선택적 파라미터
  final List<dynamic>? busList; // 선택적 파라미터

  AdminMiddleWidget({
    required this.onSearch,
    this.onBusNumberChanged, // 선택적 파라미터
    this.selectedBusNumber, // 선택적 파라미터
    this.busList, // 선택적 파라미터
    super.key,
  });

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
      height: screen.height * 0.07,
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
                  if (widget.busList != null && widget.onBusNumberChanged != null && widget.selectedBusNumber != null) // 조건부 렌더링
                    Container(
                      child: AlertDropdownButton(
                        onChanged: widget.onBusNumberChanged ?? (String? value) {}, // Provide a default function
                        currentValue: widget.selectedBusNumber,
                        busList: widget.busList!,
                      ).pOnly(right: 20),
                    ),
                  SearchWidget(onSearch: widget.onSearch),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ).pOnly(left: 20, right: 20),
        ],
      ),
    );
  }
}
