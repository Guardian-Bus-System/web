import 'package:flutter/material.dart';


//Responsive screens
class ScreenSize {
  final BuildContext context;

  ScreenSize(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  double get aspectRatio => MediaQuery.of(context).size.aspectRatio;
  double get devicePixelRatio => MediaQuery.of(context).devicePixelRatio;
}

//Responsive white space
class WhiteSpaceSize {
  final BuildContext context;
  late final ScreenSize screenSize;

  WhiteSpaceSize(this.context) {
    screenSize = ScreenSize(context);
  }

  double _spaceWidth(double multiplier) => screenSize.width * 0.00052 * multiplier;
  double _spaceHeight(double multiplier) => screenSize.height * 0.00052 * multiplier;//0.00052 아님 변경 필요

  double get spaceW1 => _spaceWidth(1);
  double get spaceW5 => _spaceWidth(5);
  double get spaceW10 => _spaceWidth(10);
  double get spaceW20 => _spaceWidth(20);
  double get spaceW30 => _spaceWidth(30);
  double get spaceW40 => _spaceWidth(40);
  double get spaceW50 => _spaceWidth(50);

  double get spaceH1 => _spaceHeight(1);
  double get spaceH5 => _spaceHeight(5);
  double get spaceH10 => _spaceHeight(10);
  double get spaceH20 => _spaceHeight(20);
  double get spaceH30 => _spaceHeight(30);
  double get spaceH40 => _spaceHeight(40);
  double get spaceH50 => _spaceHeight(50);
}