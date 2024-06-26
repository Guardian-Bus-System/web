import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/UserModel.dart';
import '../../../utils/api_endpoint.dart';

class UserController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<UserData> getUserData() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final String? token = prefs.getString('token');
      
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.userInformation);

      http.Response response = await http.get(url, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        print(data['data']);
        var userData = UserData.fromJson(data['data']);
        return userData;
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

