import 'package:capstone_front/controller/cerfication_controller.dart';
import 'package:capstone_front/screen/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/auth/authPages/change_pw_page.dart';
import 'package:capstone_front/screen/auth/authPages/login_page.dart';
import 'package:capstone_front/screen/widget/AuthWidgets/input_Field.dart';
import 'package:capstone_front/screen/widget/AuthWidgets/submit_button.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(103.0),
        child: AppBar(
          backgroundColor: backgroundColor,
          leading: IconButton(
            onPressed: (){
              Get.offAll(const LoginPage());
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
              height20,height5,
              'GBSW 귀가버스 관리 시스템'
              .text
              .textStyle(
                TextStyle(
                  fontWeight: FontWeight.w800
                )
              ).size(18).make(),
              
              height20,
              InputTextFieldWidget(textEditingController:  cerficationController.callNumberController, hitText:  '전화번호', blindetext: false,),
              height15,
              InputTextFieldWidget(textEditingController: cerficationController.cerficationNumberController, hitText: '인증번호', blindetext: false),
              height20,height5,
              SubmitButton(
                onPressed: () => 
                  //cerficationController.cerficationWidthNumber()
                  Get.to(const ChangePwPage(userName: 'userName'))
                ,
                title: '인증하기',
              ),
            ],
          ).pOnly(bottom: MediaQuery.of(context).size.width * 0.55),
        )
      ),
    );
  }
}