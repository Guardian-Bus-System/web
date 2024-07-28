import 'dart:convert';
import 'dart:ui';
import 'package:capstone_front/model/admin/Reservation.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:capstone_front/utils/auth_utils.dart';

Future<void> saveData(
  String uuid,
  String username,
  String password,
  String name,
  String phoneNumber,
  String gradeClass,
  int number,
  bool isChecked,
  VoidCallback onSuccess,
) async {
  print('_saveData called'); // Log to indicate the function is called
  if (await checkTokens()) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('token');
    print('Token: $accessToken');

    final url = Uri.parse('${ApiEndPoints.adminBaseUrl}/users/user');
    final body = jsonEncode({
      'id': uuid,
      'loginId': username,
      'pw': password,
      'name': name,
      'phoneNumber': phoneNumber,
      'gradeClass': gradeClass,
      'number': number,
      'usingCk': isChecked,
      'boardingCk': null,
    });

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    print('Sending PUT request to: $url');
    print('Body: $body');
    try {
      final response = await http.put(
        url,
        headers: headers,
        body: body,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Handle success
        print('Data saved successfully : ${response.statusCode}');
        onSuccess();
      } else {
        // Handle error
        print('Failed to save data: ${response.body}');
      }
    } catch (e) {
      // Handle exception
      print('Error occurred while saving data: $e');
    }
  }
}

//학생 탑승 내역
class AdminBoardListController {
  final String baseUrl = ApiEndPoints.adminBaseUrl;

  Future<List<dynamic>> fetchBuses() async {
    final response = await http.get(Uri.parse('$baseUrl/buses'));
    if (response.statusCode == 200) {
      final data = json.decode(utf8.decode(response.bodyBytes))['data'];
      // Insert 'all' option at the beginning
      data.insert(0, {'id': 'all', 'busNumber': '전체 목록'});
      return data;
    } else {
      throw Exception('Failed to load buses');
    }
  }

  Future<List<AdminReservation>> fetchReservations(String? busId) async {
    final url = busId == 'all' || busId == null
        ? '$baseUrl/reservations'
        : '$baseUrl/reservations/reservation/$busId';
        
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(utf8.decode(response.bodyBytes))['data'] as List;
      return data.map((data) => AdminReservation.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load reservations');
    }
  }
}

