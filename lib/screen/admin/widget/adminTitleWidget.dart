import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TitleWidget extends StatefulWidget {
  final String title;

  const TitleWidget({super.key, required this.title});

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            widget.title.text.bold.xl2.black
                .make()
                .pOnly(left: 20, top: 15, bottom: 15)
          ],
        )).pOnly(bottom: 35);
  }
}
