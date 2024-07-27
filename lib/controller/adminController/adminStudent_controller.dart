import 'dart:convert';
import 'package:capstone_front/model/admin/Reservation.dart';
import 'package:capstone_front/model/admin/Student.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/api_endpoint.dart';

class AdminStudentController extends GetxController {
  
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

