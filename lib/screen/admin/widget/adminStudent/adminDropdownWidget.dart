import 'dart:convert';

import 'package:capstone_front/model/admin/Reservation.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

const List<String> busNumbers = <String>['1호차', '2호차', '3호차', '4호차'];

class AlertDropdownButton extends StatelessWidget {
  final void Function(String?) onChanged;
  final String? currentValue;

  const AlertDropdownButton({required this.onChanged, required this.currentValue, super.key});

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
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  final void Function(String?) onChanged;
  final String? currentValue;

  const DropdownMenuExample({required this.onChanged, required this.currentValue, super.key});

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
        items: busNumbers.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
