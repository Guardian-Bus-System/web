import 'dart:convert';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TokenController extends GetxController {
  Future<void> getTokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? refreshToken = prefs.getString('refreshToken');
    var headers = {
      'Content-Type': 'application/json',
      'refreshToken': '$refreshToken'
    };
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.refreashToken);

    http.Response response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      print('만기된 엑세스토큰을 다시 발급함');
      var data = jsonDecode(response.body);

      var accessToken =
          data['data']['accessToken']; // Accessing the accessToken value
      prefs.setString(
          'token', accessToken); // refreshToken 으로 받은 accessToken 다시저장
      //await checkTokens();
    }
  }
}
