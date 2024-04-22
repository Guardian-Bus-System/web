import 'package:capstone_front/controller/change_pw_controller.dart';
import 'package:capstone_front/screen/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/CustomSide/font_size.dart';
import 'package:capstone_front/screen/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/widget/AuthWidgets/input_Field.dart';
import 'package:capstone_front/screen/widget/AuthWidgets/submit_button.dart';
import 'package:capstone_front/utils/img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangePwPage extends StatefulWidget {
  final String userName;
  const ChangePwPage({super.key, required this.userName});

  @override
  State<ChangePwPage> createState() => _ChangePwPageState();
}

class _ChangePwPageState extends State<ChangePwPage> {
  ChangePasswordController changePasswordController = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(103.0),
        child: AppBar(
          backgroundColor: backgroundColor,
          leading: IconButton(
            onPressed: (){
              Get.offAllNamed('/login');
            },
            icon: const Icon(Icons.arrow_back)
          ),
        ).pSymmetric(h: 15, v: 25),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              height15,
              Image.asset(gbswLogoUrl,width: 90),
              height30,
              'GBSW 귀가버스 관리 시스템'
              .text
              .textStyle(
                TextStyle(
                  fontWeight: FontWeight.w800
                )
              ).size(18).make(),
              
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  '${widget.userName}님 환영합니다.'.text.size(FontSiz14).make().pSymmetric(h: 25, v: 2),
                ],
              ),
              InputTextFieldWidget(textEditingController:  changePasswordController.passwordController, hitText:  '변경할 패스워드 입력', blindetext: true),
              height15,
              InputTextFieldWidget(textEditingController: changePasswordController.checkPasswordController, hitText: '패스워드 확인',  blindetext: true),
              height30,height5,
              SubmitButton(
                onPressed: () => changePasswordController.changeWithPassword(),
                title: '변경하기',
              ),
            ],
          ).pOnly(bottom: MediaQuery.of(context).size.width * 0.56),
        )
      ),
    );
  }
}