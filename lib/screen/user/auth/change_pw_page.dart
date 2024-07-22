import 'package:capstone_front/controller/userController/change_pw_controller.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/CustomSide/font_size.dart';
import 'package:capstone_front/CustomSide/spaceing_box.dart';
import 'package:capstone_front/controller/userController/user_controller.dart';
import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/model/data.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/input_Field.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/submit_button.dart';
import 'package:capstone_front/utils/auth_utils.dart';
import 'package:capstone_front/utils/img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangePwPage extends StatefulWidget {
  const ChangePwPage({super.key});

  @override
  State<ChangePwPage> createState() => _ChangePwPageState();
}

class _ChangePwPageState extends State<ChangePwPage> {
  UserController userController = Get.put(UserController());
  ChangePasswordController changePasswordController = Get.put(ChangePasswordController());
  
  Rx<User> userdata = USERDATA;

  @override
  void initState() {
    _getUserName();
    super.initState();
  }

  Future<void> _getUserName() async {
    if(await checkTokens()){
      UserResponse userResponse = await userController.getUserData();
      userdata.value = userResponse.data;
    }
  }
  @override
  void dispose() {
    Get.delete<UserController>();
    Get.delete<ChangePasswordController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: backgroundColor,
          leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, size: 30)
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
              height30,
              'GBSW 귀가버스 관리 시스템'.text
              .textStyle(TextStyle(fontWeight: FontWeight.w800)).size(18).make(),
              
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  '${userdata.value.name}님 환영합니다.'.text.size(FontSiz14).make().pSymmetric(h: 25, v: 2),
                ],
              ),
              InputTextFieldWidget(textEditingController: changePasswordController.changePasswordController, hitText: '변경할 패스워드 입력',  blindetext: true),
              height15,
              InputTextFieldWidget(textEditingController: changePasswordController.checkChangePasswordController, hitText: '패스워드 확인',  blindetext: true),
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