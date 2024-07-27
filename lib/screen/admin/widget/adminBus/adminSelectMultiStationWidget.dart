//다중선택
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class SelectStationsWidget extends StatefulWidget {
  @override
  _SelectStationsWidgetState createState() => _SelectStationsWidgetState();
}

class _SelectStationsWidgetState extends State<SelectStationsWidget> {
  // 드롭다운 메뉴 항목 리스트
  final List<String> _dropdownItems = ['칠곡', '북부정류장앞', '안동역', '천생초앞', '탑정형외과'];

  // 선택된 값 리스트 - 초기값으로 '칠곡' 설정
  List<String> _selectedValues = ['칠곡'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 46,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color.fromARGB(255, 163, 163, 163)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: MultiSelectDialogField(
        items: _dropdownItems
            .map((item) => MultiSelectItem<String>(item, item))
            .toList(),
        initialValue: _selectedValues, // 초기값 설정
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        buttonIcon: Icon(
          Icons.arrow_drop_down,
        ),
        buttonText: Text(
          _selectedValues.length > 1
              ? '${_selectedValues.first} 외 ${_selectedValues.length - 1}개'
              : _selectedValues.isEmpty
                  ? "Select Stations"
                  : _selectedValues.first,
          style: TextStyle(fontSize: 17),
        ),
        onConfirm: (results) {
          setState(() {
            _selectedValues = results.cast<String>();
          });
        },
        chipDisplay: MultiSelectChipDisplay.none(),
      ),
    );
  }
}
