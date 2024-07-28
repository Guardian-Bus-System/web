import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../../../model/UserModel.dart';
import '../../../utils/api_endpoint.dart';

class UserController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<UserResponse> getUserData() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final String? token = prefs.getString('token'); 
      
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.userInformation + ApiEndPoints.authEndPoints.userMe);

      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // 여기서 `data`가 Map인지 확인합니다.
        if (data is Map<String, dynamic>) {
          var userData = UserResponse.fromJson(data);
          return userData;
        } else {
          throw TypeError(); // 올바른 타입이 아닐 경우 에러.
        }
      } else {
        var errorMessage = jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
        throw errorMessage;
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', e.toString());
      rethrow;
    }
  }

  Future<UserResponse> getUserAdminData() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final String? token = prefs.getString('token'); 
      
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var url = Uri.parse(ApiEndPoints.adminBaseUrl + ApiEndPoints.authEndPoints.userInformation);

      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // 여기서 `data`가 Map인지 확인합니다.
        if (data is Map<String, dynamic>) {
          var userData = UserResponse.fromJson(data);
          return userData;
        } else {
          throw TypeError(); // 올바른 타입이 아닐 경우 에러.
        }
      } else {
        var errorMessage = jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
        throw errorMessage;
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', e.toString());
      rethrow;
    }
  }
}
