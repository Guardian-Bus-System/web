import 'dart:convert';
import 'package:capstone_front/model/RulesModel.dart';
import 'package:capstone_front/utils/api_endpoint.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RulesController extends GetxController {

  Future<RuleResponse> getRules() async {
    try {
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.rules);

      http.Response response = await http.get(url);
      
      if (response.statusCode == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        var rulesData = RuleResponse.fromJson(data);

        return rulesData;
      } else {
        Get.snackbar('오류', '가져오려던 목록이 없습니다.');
        throw Exception('Failed to load notices. Status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      rethrow;
    }
  }
}
