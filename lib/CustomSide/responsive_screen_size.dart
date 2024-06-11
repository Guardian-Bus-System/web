import 'package:flutter/material.dart';

//가로 세로 반응형 기준
class ScreenSize {
  final BuildContext context;
  
  ScreenSize(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  double get aspectRatio => MediaQuery.of(context).size.aspectRatio;
  double get devicePixelRatio => MediaQuery.of(context).devicePixelRatio;
}

//반응형 여백
class WhiteSpaceSize {
  final BuildContext context;
  late final ScreenSize screenSize;

  WhiteSpaceSize(this.context) {
    screenSize = ScreenSize(context);
  }

  double _spaceWidth(double multiplier) => screenSize.width * 0.00052 * multiplier;//세로 1920 기준 1px = 0.00052%
  double _spaceHeight(double multiplier) => screenSize.height * 0.09259 * multiplier;//세로 1080 기준 1px = 0.09259%

  //가로 spaceW(n) , n = px;
  double get spaceW1 => _spaceWidth(1);
  double get spaceW5 => _spaceWidth(5);
  double get spaceW10 => _spaceWidth(10);
  double get spaceW20 => _spaceWidth(20);
  double get spaceW30 => _spaceWidth(30);
  double get spaceW40 => _spaceWidth(40);
  double get spaceW50 => _spaceWidth(50);

  //세로 spaceH(n) , n = px;
  double get spaceH1 => _spaceHeight(1);
  double get spaceH5 => _spaceHeight(5);
  double get spaceH10 => _spaceHeight(10);
  double get spaceH20 => _spaceHeight(20);
  double get spaceH30 => _spaceHeight(30);
  double get spaceH40 => _spaceHeight(40);
  double get spaceH50 => _spaceHeight(50);
  double get spaceH60 => _spaceHeight(60);
  double get spaceH70 => _spaceHeight(70);
}