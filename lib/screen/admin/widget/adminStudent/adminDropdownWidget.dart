import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

/// Flutter code sample for [DropdownButton].

const List<String> list = <String>['1호차', '2호차', '3호차', '4호차'];

class AlertDropdownButton extends StatelessWidget {
  const AlertDropdownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(5)),
      width: 175,
      height: 40,
      child: DropdownMenuExample(),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        // 왜 적용이 안 되는지는 모르겠음..! 근데 얘가 있어야지 길이 조절이 되어서 그냥 놔두는게 좋을 거 같아용ㅇ
        hint: '호차를 선택하세요'.text.make(),
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 0,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('DropdownButton Sample')),
      body: AlertDropdownButton(),
    ),
  ));
}
