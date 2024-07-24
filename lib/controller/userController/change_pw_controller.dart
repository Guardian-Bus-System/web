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

class ChangePasswordController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController changePasswordController = TextEditingController();
  TextEditingController checkChangePasswordController = TextEditingController();
  UserController userController = UserController();

  Future<void> changeWithPassword() async {
    if (Validate.validatePasswordConfirm(changePasswordController.text,
            checkChangePasswordController.text) !=
        null) {
      // 패스워드 확인
      Get.snackbar('패스워드 오류', '패스워드가 일치하기 않습니다.');
    } else {
      // 서버 전송
      final SharedPreferences prefs = await _prefs;
      final String? token = prefs.getString('token');

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var url = Uri.parse(ApiEndPoints.baseUrl +
          ApiEndPoints.authEndPoints.userInformation +
          ApiEndPoints.authEndPoints.userMe +
          ApiEndPoints.authEndPoints.pwUpdate);
      Map body = {
        "newPassword": changePasswordController.text,
      };

      http.Response response =
          await http.put(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        Get.snackbar('변경완료', '${data['data']}\n 로그인 화면으로 이동합니다.');
        prefs?.clear();
        await Future.delayed(const Duration(seconds: 3));
        changePasswordController.clear();
        checkChangePasswordController.clear();
        Get.delete<UserController>();
        Get.to(const LoginPage());
      } else {
        print("200 아님");
        throw jsonDecode(response.body)['Message'] ?? "Unknown Error Occured";
      }
    }
  }
}
