// 종착역 선택 드롭다운
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TerminusDropdownWidget extends StatefulWidget {
  @override
  _TerminusDropdownState createState() => _TerminusDropdownState();
}

class _TerminusDropdownState extends State<TerminusDropdownWidget> {
  // 초기 선택된 값이 리스트의 첫 번째 항목과 일치하도록 설정
  String _selectedValue = '동대구역';

  // 드롭다운 메뉴 항목 리스트
  final List<String> _dropdownItems = ['동대구역', '옥동', '3공단부영APT(중리)', '구미역'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 46,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color.fromARGB(255, 163, 163, 163)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue!;
            });
          },
          items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          isExpanded: true, // 드롭다운 메뉴가 전체 너비를 차지하도록 설정
        ),
      ).pOnly(left: 10),
    );
  }
}
