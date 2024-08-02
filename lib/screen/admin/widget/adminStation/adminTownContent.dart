import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:capstone_front/CustomSide/responsive_screen_size.dart';

class AdminTownContent extends StatefulWidget {
  const AdminTownContent({Key? key}) : super(key: key);

  @override
  State<AdminTownContent> createState() => _AdminTownContentState();
}

class _AdminTownContentState extends State<AdminTownContent> {
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
          children: List.generate(10, (index) {
            return Container(
              // 기본적으로 부여되는 button의 padding 요소로 인해, container width가 기본 100px + 10px 꼴이 되어버림!
              // 혹시 해결 방법을 알고 계신다면 해결 부탁드려요...
              width: 110,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: Color.fromARGB(255, 45, 45, 45)),
                  borderRadius: BorderRadius.circular(30)),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // 패딩 없애기
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    '대구'.text.black.xl.make().pOnly(right: 5),
                    IconButton(
                      icon: const Icon(Icons.close),
                      color: const Color.fromARGB(255, 45, 45, 45),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            );
          })).pOnly(top: 20),
    );
  }
}
