import 'dart:convert';

import 'package:capstone_front/screen/user/auth/change_pw_page.dart';
import 'package:capstone_front/screen/user/pages/home_screen.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class CerficationController extends GetxController {
  TextEditingController cerficationNumberController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> cerficationWidthCallNumber() async {
    final SharedPreferences prefs = await _prefs;
    final String? token = prefs.getString('token');
    
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var url = Uri.parse(
      ApiEndPoints.baseUrl + 
      ApiEndPoints.authEndPoints.userInformation + 
      ApiEndPoints.authEndPoints.userMe + 
      ApiEndPoints.authEndPoints.cerficationSend
    );//인증번호 요청

    http.Response response = await http.post(url,headers: headers);

    if(response.statusCode == 200){
      return true;
    }
    else{
      return false;
    }
  }

  Future<bool> cerficationWidthSendNumber() async {
    final SharedPreferences prefs = await _prefs;
    final String? token = prefs.getString('token');
    
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var url = Uri.parse(
      ApiEndPoints.baseUrl + 
      ApiEndPoints.authEndPoints.userInformation +
      ApiEndPoints.authEndPoints.userMe + 
      ApiEndPoints.authEndPoints.cerficationVerify
    );//번호 인증 인증
    Map body = {
      'code' : cerficationNumberController.text.trim(),
    };

    http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);
    
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    if(data['data'] == true){
      
      Get.snackbar('인증완료', '인증이 완료되어습니다.');
      await Future.delayed(const Duration(seconds: 2)); // 2초 대기
      Get.to(const ChangePwPage());
      return true;
    }
    else{
      Get.snackbar('인증실패', '다시 인증 해주세요.');
      cerficationNumberController.clear();
      return false;
    }
  }
}