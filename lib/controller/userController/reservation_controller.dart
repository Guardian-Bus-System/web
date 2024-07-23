import 'dart:convert';
import 'package:capstone_front/controller/userController/busInfo_controller.dart';
import 'package:capstone_front/model/ReservationModel.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:get/get.dart';
import 'package:capstone_front/routes/mainView.dart' as mainView;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

<<<<<<< HEAD
class BusCityController extends GetxController {

  // 예약 정보를 서버에 전송하는 메서드
  Future<void> sendUserReservation({required int busNumber,required String? selectedVillage}) async {
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.userReservationsApi);
=======
class ReservationController extends GetxController {
  // 예약 정보를 서버에 전송하는 메서드
  Future<void> sendUserReservation(
      {required int busNumber, required String? selectedVillage}) async {
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.userReservationsApi);
>>>>>>> 896976be7360d68254617b082fdb27152952e764

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('token');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    String? parsedVillage;
    if (selectedVillage != null) {
      List<String> parts = selectedVillage.split('-');
      if (parts.length > 1) {
        parsedVillage = parts[1].trim(); // 하이픈 뒤의 문자열을 추출하고 공백 제거
      } else {
        parsedVillage = parts[0].trim(); // 하이픈이 없을 경우 전체를 사용
      }
    }

<<<<<<< HEAD
    Map body = {
      'busNumber': busNumber,
      'endCity': parsedVillage
    };

    try {
      // HTTP POST 요청 보내기
      http.Response response = await http.put(url, headers: headers, body: jsonEncode(body));
      
        print('Reservation completed${response.statusCode}');
=======
    Map body = {'busNumber': busNumber, 'endCity': parsedVillage};

    try {
      // HTTP POST 요청 보내기
      http.Response response =
          await http.put(url, headers: headers, body: jsonEncode(body));

      print('Reservation completed${response.statusCode}');
>>>>>>> 896976be7360d68254617b082fdb27152952e764

      if (response.statusCode == 200) {
        print('Reservation completed');
        Get.toNamed('/');
        Get.snackbar('예약완료', '버스예약 정보가 수정되었습니다.');
<<<<<<< HEAD
        
      } else {
        // 에러 메시지를 파싱하여 예외 발생
        var errorMessage = jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
=======
      } else {
        // 에러 메시지를 파싱하여 예외 발생
        var errorMessage =
            jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
>>>>>>> 896976be7360d68254617b082fdb27152952e764
        throw errorMessage;
      }
    } catch (e) {
      print('Error: $e'); // 에러 메시지 출력
      Get.snackbar('Error', e.toString());
      rethrow; // 에러를 다시 던져서 호출 코드에서 처리할 수 있게 함
    }
  }

  Future<void> sendUserTakeBusCheck({required bool isTake}) async {
    UserBusInfoController busCityController = UserBusInfoController();
<<<<<<< HEAD
    ReservationResponse reservationData =  await busCityController.getUserBusInfo();
    String id = reservationData.data!.id;

    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.userReservationsApi + "/${id}");
    
=======
    ReservationResponse reservationData =
        await busCityController.getUserBusInfo();
    String id = reservationData.data!.id;

    var url = Uri.parse(ApiEndPoints.baseUrl +
        ApiEndPoints.authEndPoints.userReservationsApi +
        "/${id}");

>>>>>>> 896976be7360d68254617b082fdb27152952e764
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('token');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

<<<<<<< HEAD
    Map body = {
      'onCk': isTake
    };

    http.Response response = await http.put(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      
=======
    Map body = {'onCk': isTake};

    http.Response response =
        await http.put(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
>>>>>>> 896976be7360d68254617b082fdb27152952e764
      print(isTake);
      Get.toNamed('/');
      Get.snackbar('수정완료', '탑승여부 수정 완료되었습니다.');
      Get.to(mainView.MainView());
    } else {
      // 에러 메시지를 파싱하여 예외 발생
<<<<<<< HEAD
      var errorMessage = jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
      throw errorMessage;
    }

=======
      var errorMessage =
          jsonDecode(response.body)['message'] ?? "Unknown Error Occurred";
      throw errorMessage;
    }
>>>>>>> 896976be7360d68254617b082fdb27152952e764
  }
}
