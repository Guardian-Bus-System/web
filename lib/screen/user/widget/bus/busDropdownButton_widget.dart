import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/model/BusModel.dart';

class BusDropDownButtonWidget extends StatefulWidget {
  const BusDropDownButtonWidget({Key? key}) : super(key: key);

  @override
  BusDropDownButtonWidgetState createState() => BusDropDownButtonWidgetState();
}

class BusDropDownButtonWidgetState extends State<BusDropDownButtonWidget> {
  List<String> dropdownItems = ['하차 지점을 선택해주세요.'];
  String? selectedItem = '하차 지점을 선택해주세요.';

  void updateDropdownItems(UserBus busCity) {
    List<String> items = [];
    busCity.towns.forEach((town) {
      town.busVillages.forEach((village) {
        items.add('${town.townName} - ${village.villageName}');
      });
    });

    setState(() {
      dropdownItems = items;
      selectedItem = items.isNotEmpty ? items[0] : null;
    });
  }

  // 새로 추가된 getter: 선택된 village 값을 반환
  String? get selectedVillage => selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        iconSize: 40,
        isExpanded: true,
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            selectedItem = newValue;
          });
        },
        items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: value.text.make(),
          );
        }).toList(),
      ).pOnly(left: 20, right: 15),
    ).pOnly(right: 15);
  }
}
