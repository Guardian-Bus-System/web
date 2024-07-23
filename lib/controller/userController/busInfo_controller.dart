import 'dart:convert';
import 'package:capstone_front/model/ReservationModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/api_endpoint.dart';

class UserBusInfoController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<ReservationResponse> getUserBusInfo() async {
    final SharedPreferences prefs = await _prefs;
    final String? token = prefs.getString('token');

    try {
      var url = Uri.parse(
        ApiEndPoints.baseUrl + 
        ApiEndPoints.authEndPoints.userReservationsApi +
        ApiEndPoints.authEndPoints.userMe
      );
      
      var headers = {
        'Authorization': 'Bearer $token'
      };

      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        var userBusInfo = ReservationResponse.fromJson(data);
        return userBusInfo;
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
