import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 120, // drawer width 크기조절
      child: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1.5)),
                child: Row(children: [Text('DrawerHeadeasddr')]),
              ),
              decoration: BoxDecoration(color: Colors.grey[400]),
              padding: const EdgeInsets.all(30), // 검은테두리 밖의 회색영역
              margin: const EdgeInsets.all(10), // 흰색 영역
            ),
            Flexible(
              child: Container(
                color: Colors.blue,
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.green,
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.red,
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.deepPurple,
              ),
            ),
          ],
        )),
    );
  }
}