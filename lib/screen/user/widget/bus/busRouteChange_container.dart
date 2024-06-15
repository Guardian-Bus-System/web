import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BusRouteChangeContainer extends StatelessWidget {
  final String containerName;
  final Widget child;
  final bool shadowBool;

  const BusRouteChangeContainer({super.key, required this.child, required this.containerName, required this.shadowBool});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: shadowBool ? BoxDecoration(
        color: bacgroundOrTextColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 4.0,
            offset: const Offset(2, 10),
          ),], 
        )
        : null,
      child: Column(
        children: [
          Row(
            children: [
              containerName.text.bold.size(FontSiz15).make(),
            ],
          ),
          child
        ],
      ).pOnly(
        left: shadowBool ? 15 : 0, 
        right: shadowBool ? 0 : 0, 
        top: shadowBool ? 10 : 0,
        bottom: shadowBool ? 20 : 0
      )
    );
  }
}