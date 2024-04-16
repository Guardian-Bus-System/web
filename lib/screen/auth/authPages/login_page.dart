import 'package:capstone_front/controller/login_controller.dart';
import 'package:capstone_front/screen/CustomSide/spaceing_box.dart';
import 'package:capstone_front/screen/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/auth/authPages/cerfication_page.dart';
import 'package:capstone_front/utils/img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/input_Field.dart';
import '../widgets/submit_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginController loginController = Get.put(LoginController());

  var isLogin = false.obs;
  var isCerfication = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child:AppBar(backgroundColor: backgroundColor,),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 14),
              Image.asset(gbswLogoUrl,width: 90),
              height30,
              'GBSW 귀가버스 관리 시스템'
              .text
              .textStyle(
                const TextStyle(
                  fontWeight: FontWeight.w800
                )
              ).size(18).make(),
          
              height30,height5,
              InputTextFieldWidget(textEditingController: loginController.emailController, hitText: '아이디',  blindetext: false),
          
              height15,
              InputTextFieldWidget(textEditingController: loginController.passwordController, hitText: '패스워드',  blindetext: true),
              
              height30,height5,
              SubmitButton(
                onPressed: () => loginController.loginWithEmail(),
                title: '로그인',
              ),
              height30,height5,
              Row(
                children: [
                  '패스워드를 잊으셨나요?'.text.size(12).make(),
                  TextButton(
                    onPressed: () {
                      Get.to(CerficationPage());
                    }, 
                    child: '패스워드 찾기'.text.size(12).textStyle(
                      const TextStyle(
                        color: baseColor,
                        decoration: TextDecoration.underline,
                        decorationColor: baseColor
                      )
                    ).make()
                  )
                ],
              ).pSymmetric(h:25)
            ],
          ).pOnly(bottom: MediaQuery.of(context).size.width * 0.3),
        )
      ),
    );
  }
}