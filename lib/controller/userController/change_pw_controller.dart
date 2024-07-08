import 'dart:async';
import 'dart:convert';
import 'package:capstone_front/controller/userController/user_controller.dart';
import 'package:capstone_front/screen/user/auth/login_page.dart';
import 'package:capstone_front/screen/user/widget/AuthWidgets/formatter.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class ChangePasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController changePasswordController = TextEditingController();
  TextEditingController checkChangePasswordController = TextEditingController();
  UserController userController = UserController();

  Future<void> changeWithPassword() async {
    if(Validate.validatePassword(passwordController.text) == null){ // 패스워드 유효성 검사
      var user = await userController.getUserData();
      
      if(Validate.validatePasswordConfirm(changePasswordController.text, checkChangePasswordController.text) == null){ // 패스워드 확인
        print('not Same');
      }
      else{// 서버 전송
        try{
          var headers = {'Content-Type': 'application/json'};
          var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.registerEmail);
          Map body = {
            "pw": passwordController.text,
            "changePw": changePasswordController.text,
            "gradeClass": "${user.data.gradeClass}",
            "number": user.data.number
          };

          http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

          if(response.statusCode == 200){
            var data = jsonDecode(response.body.toString());
            print(data['token']);
            print('account created successfuly');

            passwordController.clear();
            Get.to(LoginPage());
            
          }
          else{
            print("200 아님");
            throw jsonDecode(response.body)['Message'] ?? "Unknown Error Occured";
          }

        }catch(e){
          Get.back();
          showDialog(
            context: Get.context!,
            builder: (context) {
              return SimpleDialog(
                title: 'Error'.text.make(),
                children: [e.toString().text.make()],
              ).p(20);
            }
          );
        }
      }
    }else{
      print('다시 입력');
    }
  }
}