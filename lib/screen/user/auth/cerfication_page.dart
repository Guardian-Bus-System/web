import 'package:capstone_front/controller/userController/cerfication_controller.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/user/auth/change_pw_page.dart';
import 'package:capstone_front/screen/user/auth/login_page.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/input_Field.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/submit_button.dart';
import 'package:capstone_front/utils/img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CerficationPage extends StatefulWidget {
  const CerficationPage({super.key});

  @override
  State<CerficationPage> createState() => _CerficationPageState();
}

class _CerficationPageState extends State<CerficationPage> {
  CerficationController cerficationController = Get.put(CerficationController());

  RxBool isSend = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: backgroundColor,
          leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, size: 30,)
          ),
        ).pSymmetric(h: 5, v: 5),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              height15,
              Image.asset(gbswLogoUrl,width: 90),
              height20, height5,
              'GBSW 귀가버스 관리 시스템'
              .text
              .textStyle(
                TextStyle(
                  fontWeight: FontWeight.w800
                )
              ).size(18).make(),
              
              height20,
              InputTextFieldWidget(
                textEditingController: cerficationController.cerficationNumberController, 
                hitText: '인증번호', 
                blindetext: true
              ),
              height25,
              Obx(() => SubmitButton(
                onPressed: () async {
                  if (!isSend.value) {
                    bool success = await cerficationController.cerficationWidthCallNumber();
                    if (success) {
                      isSend.value = true;
                    }
                  } else {
                    bool success = await cerficationController.cerficationWidthSendNumber();
                    if (success) {
                      isSend.value = false;
                      // 인증 완료 후 추가 동작을 여기에 추가할 수 있습니다.
                    }
                  }
                },
                title: isSend.value ? '인증하기' : '인증번호받기',
              ))
            ],
          ).pOnly(bottom: MediaQuery.of(context).size.width * 0.55),
        )
      ),
    );
  }
}
