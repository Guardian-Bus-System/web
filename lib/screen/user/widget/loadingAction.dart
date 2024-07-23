import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:flutter/material.dart';

class LoadingProgressIndecatorWidget extends StatelessWidget {

  const LoadingProgressIndecatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: baseColor,semanticsLabel: 'Loading...',));
  }
}
