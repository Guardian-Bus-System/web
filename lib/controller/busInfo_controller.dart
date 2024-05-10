import 'dart:convert';
import 'package:capstone_front/model/BusModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_endpoint.dart';

class BusInfoController extends GetxController{

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<BusData> getBusData() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final String? token = prefs.getString('token');
      
      if (token == null) throw 'Token is null'; // 토큰이 없는 경우 예외 처리

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.busInfo);

      http.Response response = await http.get(url, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var busData = BusData.fromJson(jsonDecode(response.body));
        print('busData complate');
        return busData;
      } else {
        var errorMessage = jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
        throw errorMessage;
      }
    } catch (e) {
      print('Error: $e'); // 더 자세한 에러 메시지 출력
      Get.snackbar('Error', e.toString());
      rethrow; // Rethrow the error to handle it in the calling code
    }
  }


}