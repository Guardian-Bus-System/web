import 'package:capstone_front/CustomSide/responsive_screen_size.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminPlaceNameContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return SizedBox(
      width: screen.width,
      height: screen.height * 0.5,
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 20,
        runSpacing: 15,
        alignment: WrapAlignment.start,
        children: List.generate(3, (index) {
          return Container(
            width: 110,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color.fromARGB(255, 45, 45, 45)),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero, // 패딩 없애기
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  '대구'.text.black.xl.make().pOnly(right: 5),
                  SizedBox(
                    width: 24, // 아이콘 버튼의 너비와 높이 설정
                    height: 24,
                    child: IconButton(
                      padding: EdgeInsets.zero, // 패딩 없애기
                      icon: const Icon(Icons.close),
                      color: const Color.fromARGB(255, 45, 45, 45),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ).pOnly(top: 20),
    );
  }
}
