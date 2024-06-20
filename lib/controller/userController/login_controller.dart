import 'dart:convert';

import 'package:capstone_front/screen/user/pages/home_screen.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginWithEmail() async {
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
        print(data['data']['accessToken']);
        var accessToken = data['data']['accessToken']; // Accessing the accessToken value
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', accessToken);
        emailController.clear();
        passwordController.clear();
        Get.offAll(HomeScreen());
      } else {
        var errorMessage = jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
        throw errorMessage;
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', e.toString());
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
