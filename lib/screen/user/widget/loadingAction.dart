// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingActionWidget extends StatelessWidget {
  final Widget child;
  final RxList item;

  const LoadingActionWidget({
    Key? key,
    required this.child, required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (item.isEmpty) {
        return const Center(child: CircularProgressIndicator(color: baseColor,semanticsLabel: 'Loading...',));
      }else{
        return child;
      }
    });
  }
}
