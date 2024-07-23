import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/model/BusModel.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BusListItemWidget extends StatefulWidget {
  final UserBus userBusInfo;
  final double listItemHeight;
  final double listItemWidth;

  const BusListItemWidget({super.key, required this.listItemHeight, required this.listItemWidth, required this.userBusInfo});

  @override
  State<BusListItemWidget> createState() => _BusListItemWidgetState();
}

class _BusListItemWidgetState extends State<BusListItemWidget> {
  
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.listItemHeight, width: widget.listItemWidth,
      child: Row(
        children: <Widget>[
          Stack(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              Container(
                height: widget.listItemHeight,
                width: widget.listItemWidth - 5,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0,
                      blurRadius: 4.0,
                      offset: const Offset(0, 5),
                    ),], 
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    '${widget.userBusInfo.busNumber}호차'.text.size(FontSiz15).make(),
                    '${widget.userBusInfo.titleCityName} - ${
                      widget.userBusInfo.towns.map((town) => town.townName).join(' - ')
                    }'.text.size(FontSiz14).make(),
                    '${widget.userBusInfo.maxTable}석'.text.size(FontSiz15).make(),
                  ],
                ),
              ).pOnly(left: 5)
            ],
          ),
        ],
      ),
    ).pOnly(bottom: 5);
  }
}