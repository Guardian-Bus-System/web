// NoticeController.dart

import 'dart:convert';
import 'package:capstone_front/model/NoticesModel.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NoticeController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<NoticeResponse> getNotices() async {
    final SharedPreferences prefs = await _prefs;
    final String? token = prefs.getString('token');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.notices);

    http.Response response = await http.get(url, headers: headers); 

    try {      

      if (response.statusCode == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        var notices = NoticeResponse.fromJson(data);
        return notices;
      } else {
        var errorMessage = jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
        throw errorMessage;
      }
    } catch (e) {
      print('Error: $e'); // 에러 메시지 출력
      Get.snackbar('Error 그냥', e.toString());
      rethrow; // 에러를 다시 던져서 호출 코드에서 처리할 수 있게 함
    }
  }

  Future<void> checkNoticeDetails(int id) async {
    final SharedPreferences prefs = await _prefs;
    final String? token = prefs.getString('token');

    try {      
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var url = Uri.parse( ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.notices + "/$id");

      http.Response response = await http.get(url, headers: headers); 

      print(response.statusCode);

    } catch (e) {
      print('Error: $e'); // 에러 메시지 출력
      Get.snackbar('Error', e.toString());
      rethrow; // 에러를 다시 던져서 호출 코드에서 처리할 수 있게 함
    }
  }
}
