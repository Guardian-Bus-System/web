import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AlertDropdownButton extends StatelessWidget {
  final void Function(String?) onChanged;
  final String? currentValue;
  final List<dynamic> busList;

  const AlertDropdownButton({
    required this.onChanged,
    required this.currentValue,
    required this.busList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(5)),
      width: 175,
      height: 40,
      child: DropdownMenuExample(
        onChanged: onChanged,
        currentValue: currentValue,
        busList: busList,
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  final void Function(String?) onChanged;
  final String? currentValue;
  final List<dynamic> busList;

  const DropdownMenuExample({
    required this.onChanged,
    required this.currentValue,
    required this.busList,
    super.key,
  });

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        hint: '호차를 선택하세요'.text.make(),
        value: widget.currentValue,
        icon: const Icon(Icons.arrow_drop_down),
        style: const TextStyle(color: Colors.black),
        underline: Container(height: 0),
        onChanged: widget.onChanged,
        items: widget.busList.map<DropdownMenuItem<String>>((dynamic bus) {
          return DropdownMenuItem<String>(
            value: bus['id'].toString(),
            child: Text(bus['busNumber'] == '전체 목록' ? '전체 목록' : '${bus['busNumber']}호차',)
          );
        }).toList(),
      ),
    );
  }
}
