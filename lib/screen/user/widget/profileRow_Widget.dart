import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
<<<<<<< HEAD
=======
import 'package:capstone_front/screen/user/auth/change_pw_page.dart';
>>>>>>> 896976be7360d68254617b082fdb27152952e764
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:capstone_front/routes/mainView.dart' as mainView;
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileRowTopWidget extends StatelessWidget {
  final String leftTitle;
  final String rightTitle;
  final Color rightTitleColor;
  final String toNamedRoute;
  
  const ProfileRowTopWidget({super.key, required this.leftTitle, required this.rightTitle, required this.rightTitleColor, required this.toNamedRoute});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        height15,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftTitle.text.bold.size(FontSiz18).make(),
            InkWell(
              onTap: () {
                if (toNamedRoute == '/changePushRoute') {
                  Get.toNamed('/');
                  mainView.MainViewTabController tabController = Get.find();
                  tabController.goToTabItem(mainView.TabItem.busRoute);
                } else {
                  Get.toNamed(toNamedRoute);
                }
              },
              child:rightTitle.text.color(rightTitleColor).size(FontSiz11).make(),
            )
          ],
        ),
        const SizedBox(height: 17)
      ],
    );
  }
}

class ProfileRowSideWidget extends StatelessWidget {
  final String title;
  final String content;

  const ProfileRowSideWidget({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            title.text.color(greyText).make(),
            width40,
            SizedBox(
              width: MediaQuery.of(context).size.width - 150,
              child: content.text.bold
              .softWrap(true)
              .overflow(TextOverflow.visible) // or TextOverflow.ellipsis for ...
              .maxLines(2).make(),
            ),
          ],
        ),height15,
      ],
    );
  }
}