import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/formatter.dart';
import 'package:capstone_front/screen/user/widget/bus/busUserInfo.dart';
import 'package:capstone_front/utils/img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class BusUserInfoContainer extends StatelessWidget {
  final Rx<User> user;
  final double containerWidth;
  final double containerHeight;

  const BusUserInfoContainer({
    Key? key,
    required this.user,
    required this.containerWidth,
    required this.containerHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/');
      },
      child: Container(
        color: backgroundColor,
        height: containerHeight * 0.26,
        width: containerWidth,
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    '${user.value.name}님, 안녕하세요!'.text.size(FontSiz18).make(),
                  ],
                ),
                Row(
                  children: [
                    getFormattedDateTime().text.size(FontSiz12).color(baseColor).make(),
                  ],
                ),
                const SizedBox(height: 20),
                BusUserInfo(
                  user: user,
                  containerHeight: (containerHeight * 0.3) * 0.5,
                  containerWidth: containerWidth,
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: -20,
              child: Image.asset(busLogo, width: 170),
            ),
          ],
        ),
      ),
    );
  }
}
