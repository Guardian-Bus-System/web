import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/screen/user/widget/bus/busDropdownButton_widget.dart';

class BusLoadCheckButtonWidget extends StatelessWidget {
  final String title;
  final List<String> items;
  final GlobalKey<BusDropDownButtonWidgetState> dropDownKey;
  final bool isSelected; // 버튼이 선택되었는지 여부
  final VoidCallback onTap; // 버튼이 클릭될 때 호출되는 콜백

  const BusLoadCheckButtonWidget({
    Key? key,
    required this.title,
    required this.items,
    required this.dropDownKey,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(); // 외부에서 전달된 onTap 콜백 호출
    
        // 드롭다운 상태 업데이트
        final state = dropDownKey.currentState;
        if (state != null) {
          state.updateDropdownItems(items);
          print('Category: $title, Items: $items');
        } else {
          print('DropDownExample state is null');
        }
      },
      child: Container(
        width: 80,
        height: 35,
        decoration: BoxDecoration(
          color: isSelected ? baseColor : backgroundColor,
          border: Border.all(width: 1, color: baseColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: title.text
              .color(isSelected ? Colors.white : baseColor)
              .size(FontSiz14)
              .fontWeight(isSelected ? FontWeight.bold : FontWeight.normal) // 조건에 따라 글씨 두께 변경
              .make(),
        ),
      ),
    );
  }
}
