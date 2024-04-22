import 'package:capstone_front/screen/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/CustomSide/font_size.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BusRouteChangeContainer extends StatelessWidget {
  final String containerName;
  final Widget child;

  const BusRouteChangeContainer({super.key, required this.child, required this.containerName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
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
      ),
      child: Column(
        children: [
          Row(
            children: [
              containerName.text.bold.size(FontSiz15).make(),
            ],
          ),
          child
        ],
      ).pOnly(left: 15,right: 15 , top: 10, bottom: 20)
    );
  }
}