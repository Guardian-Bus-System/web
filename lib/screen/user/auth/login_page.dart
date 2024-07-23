import 'package:capstone_front/controller/userController/login_controller.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
<<<<<<< HEAD
import 'package:capstone_front/screen/user/widget/AuthWidgets/input_Field.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/submit_button.dart';
=======
import 'package:capstone_front/screen/user/auth/cerfication_page.dart';
>>>>>>> 896976be7360d68254617b082fdb27152952e764
import 'package:capstone_front/utils/img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

<<<<<<< HEAD
=======
import '../widget/AuthWidgets/input_Field.dart';
import '../widget/AuthWidgets/submit_button.dart';

>>>>>>> 896976be7360d68254617b082fdb27152952e764
class LoginPage extends StatefulWidget {
  final String? mode;  // 추가된 부분

  const LoginPage({super.key, this.mode = ''});  // 기본값 설정

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = Get.put(LoginController());

  var isLogin = false.obs;
  var isCerfication = false.obs;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        Get.back();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: backgroundColor,
            automaticallyImplyLeading: widget.mode != 'not main' ? false : true,  // 조건부로 백 버튼 표시
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 14),
                Image.asset(gbswLogoUrl, width: 90),
                height30,
                'GBSW 귀가버스 관리 시스템'
                    .text
                    .textStyle(
                      const TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    )
                    .size(18)
                    .make(),
                height30,
                height5,
                InputTextFieldWidget(
                  textEditingController: loginController.emailController,
                  hitText: '아이디',
                  blindetext: false,
                ),
                height15,
                InputTextFieldWidget(
                  textEditingController: loginController.passwordController,
                  hitText: '패스워드',
                  blindetext: true,
                ),
                height30,
                height5,
                SubmitButton(
                  onPressed: () => loginController.loginWithEmail(),
                  title: '로그인',
                ),
                height30,
                height5,
                // Row(
                //   children: [
                //     '패스워드를 잊으셨나요?'.text.size(12).make(),
                //     TextButton(
                //       onPressed: () {
                //         Get.to(const CerficationPage());
                //       },
                //       child: '패스워드 변경하기'
                //           .text
                //           .size(12)
                //           .textStyle(
                //             const TextStyle(
                //               color: baseColor,
                //               decoration: TextDecoration.underline,
                //               decorationColor: baseColor,
                //             ),
                //           )
                //           .make(),
                //     ),
                //   ],
                // ).pSymmetric(h: 25),
              ],
            ).pOnly(bottom: MediaQuery.of(context).size.width * 0.3),
          ),
        ),
      ),
    );
  }
}
