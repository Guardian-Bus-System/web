import 'dart:convert';
import 'package:capstone_front/controller/userController/token_controller.dart';
import 'package:capstone_front/screen/user/pages/home_screen.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:capstone_front/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TokenController tokenController = TokenController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginWithEmail() async {
    if ( await checkTokens() ) {
      tokenController.getTokens();
    } else {
      try {
        var headers = {'Content-Type': 'application/json'};
        var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginEmail);
        
        Map body = {
          'loginId': emailController.text.trim(),
          'pw': passwordController.text,
        };

        http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          //토큰 처리
          var accessToken = data['data']['accessToken']; // Accessing the accessToken value
          var refreshToken = data['data']['refreshToken'];
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('token', accessToken);
          prefs.setString('refreshToken', refreshToken);
          
          //컨트롤러 초기화
          emailController.clear();
          passwordController.clear();
          
          Get.toNamed('/');
        } else {
          var errorMessage = jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
          throw errorMessage;
        }
      } catch (e) {
        print('Error: $e');
        Get.snackbar('Error', e.toString());
      }
    }
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}

