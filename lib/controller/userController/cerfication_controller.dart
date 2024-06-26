import 'dart:async';
import 'dart:convert';

import 'package:capstone_front/screen/user/pages/home_screen.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class CerficationController extends GetxController {
  TextEditingController callNumberController = TextEditingController();
  TextEditingController cerficationNumberController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> cerficationWidthCallNumber() async {
    try{
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginEmail);//전화번호 인증
      Map body = {
        'phoneNumber' : callNumberController.text.trim(),
      };
      http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('account created successfuly');
        final SharedPreferences? prefs = await _prefs;

        await prefs?.setString('token', data['token']);//토큰 저장
        callNumberController.clear();
        Get.offAll(HomeScreen());
      }
      else{
        throw jsonDecode(response.body)['Message'] ?? "Unknown Error Occured";
      }

    }catch(e){
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SizedBox(
            height: 100,width: 100,
            child: ListTile(
              title: 'Error'.text.make(),
              subtitle: e.toString().text.make(),
            ).p(20),
          );
        }
      );
    }
  }

  Future<void> cerficationWidthNumber() async {
    try{
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginEmail);//전화번호 인증
      Map body = {
        'cerficationNumber' : cerficationNumberController.text.trim(),
      };
      http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('account created successfuly');
        final SharedPreferences? prefs = await _prefs;

        await prefs?.setString('token', data['token']);//토큰 저장
        cerficationNumberController.clear();
        Get.offAll(HomeScreen());
      }
      else{
        throw jsonDecode(response.body)['Message'] ?? "Unknown Error Occured";
      }

    }catch(e){
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SizedBox(
            height: 100,width: 100,
            child: ListTile(
              title: 'Error'.text.make(),
              subtitle: e.toString().text.make(),
            ).p(20),
          );
        }
      );
    }
  }
}