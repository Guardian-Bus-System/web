import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BusDropDownButtonWidget extends StatefulWidget {
  const BusDropDownButtonWidget({Key? key}) : super(key: key);

  @override
  BusDropDownButtonWidgetState createState() => BusDropDownButtonWidgetState();
}

class BusDropDownButtonWidgetState extends State<BusDropDownButtonWidget> {
  List<String> dropdownItems = ['하차 지점을 선택해주세요.'];
  String? selectedItem = '하차 지점을 선택해주세요.';

  void updateDropdownItems(List<String> items) {
    setState(() {
      dropdownItems = items;
      selectedItem = items.isNotEmpty ? items[0] : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height20,
        Container(
          width: screen.width,
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
        ).pOnly(right: 15),
      ],
    );
  }
}