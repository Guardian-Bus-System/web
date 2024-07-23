// lib/controller/BusInfoController.dart
import 'dart:convert';
import 'package:capstone_front/model/BusModel.dart';
import 'package:capstone_front/model/CityModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/api_endpoint.dart';

class UserBusListController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<UserBusListResponse> getUserBusListInfo() async {
    final SharedPreferences prefs = await _prefs;
    final String? token = prefs.getString('token');

    if (token == null) {
      throw 'Token is null';
    } else {
      try {
        var url = Uri.parse( ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.userBusApi );

        http.Response response = await http.get(url);
        if (response.statusCode == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        var userBusData = UserBusListResponse.fromJson(data);
          return userBusData;
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

  Future<UserBusListResponse> getAdminUserBusListInfo() async {
    final SharedPreferences prefs = await _prefs;
    final String? token = prefs.getString('token');

    if (token == null) {
      throw 'Token is null';
    } else {
      try {
        var url = Uri.parse( ApiEndPoints.adminBaseUrl + ApiEndPoints.authEndPoints.userBusApi );

        http.Response response = await http.get(url);
        if (response.statusCode == 200) {
          
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        var userBusData = UserBusListResponse.fromJson(data);
          return userBusData;
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
}
