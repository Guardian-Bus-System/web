import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminRowAddButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const AdminRowAddButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            //style 폼 건들지 말것!!!!!!!!!!!!
            //녱(sex)
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(40, 30),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onPressed,
            child: Row(children: [
              Icon(
                Icons.add,
                color: Colors.black,
              ),
              '추가하기'.text.black.xl.make(),
            ])),
      ],
    );
  }
}