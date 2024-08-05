import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminNoticeEditTitleWidget extends StatefulWidget {
  final String title;
  final String fButtonText;
  final VoidCallback fonPressed;
  final String sButtonText;
  final VoidCallback cancel;

  const AdminNoticeEditTitleWidget({
    super.key, 
    required this.title, 
    required this.fButtonText, 
    required this.fonPressed, 
    required this.sButtonText, 
    required this.cancel
  });

  @override
  State<AdminNoticeEditTitleWidget> createState() => _AdminNoticeEditTitleWidgetState();
}

class _AdminNoticeEditTitleWidgetState extends State<AdminNoticeEditTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.title.text.bold.xl2.black.make()
            .pOnly(left: 20, top: 15, bottom: 15),
            
          Row(
            children: [
              TextButton(
                onPressed: widget.fonPressed,
                child: Container(
                  width: 76,
                  height: 42,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 73, 216, 70),
                      borderRadius: BorderRadius.circular(5)),
                  child: widget.fButtonText.text.white.center.xl.make().pOnly(top: 8),
                )),

              width15,
              TextButton(
                onPressed: widget.cancel,
                child: Container(
                  width: 76,
                  height: 42,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 236, 82, 82),
                      borderRadius: BorderRadius.circular(5)),
                  child: widget.sButtonText.text.white.center.xl.make().pOnly(top: 8),
                )),
            ],
          )
        ],
      )
    ).pOnly(bottom: 35);
  }
}
