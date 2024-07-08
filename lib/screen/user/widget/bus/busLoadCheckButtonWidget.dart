import 'package:capstone_front/model/BusModel.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/screen/user/widget/bus/busDropdownButton_widget.dart';

class BusLoadCheckButtonWidget extends StatelessWidget {
  final UserBus busCity; // BusCity 객체를 사용
  final GlobalKey<BusDropDownButtonWidgetState> dropDownKey;
  final bool isSelected; // 버튼이 선택되었는지 여부
  final VoidCallback onTap; // 버튼이 클릭될 때 호출되는 콜백

  const BusLoadCheckButtonWidget({
    Key? key,
    required this.busCity, // BusCity 객체
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
          state.updateDropdownItems(busCity); // BusCity의 이름을 사용
        } else {
          print('DropDownButtonWidget state is null');
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 75,
        height: 35,
        decoration: BoxDecoration(
          color: isSelected ? baseColor : backgroundColor,
          border: Border.all(width: 1, color: baseColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: '${busCity.busNumber}호차 ${
                  busCity.busName}-${
                  busCity.towns.map((town) => town.townName).join(' - ')} - ${
                  busCity.maxTable}석'.text // BusCity의 이름을 표시
              .color(isSelected ? Colors.white : baseColor)
              .size(FontSiz14)
              .fontWeight(isSelected ? FontWeight.bold : FontWeight.normal) // 조건에 따라 글씨 두께 변경
              .make(),
        ),
      ),
    );
  }
}
