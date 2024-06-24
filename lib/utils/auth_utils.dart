import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:capstone_front/screen/user/auth/login_page.dart';

Future<bool> checkTokens() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  
  final String? accessToken = prefs.getString('token');
  final String? refreshToken = prefs.getString('token');
  if (accessToken != null) {
    return true;
  } else {

    Get.to(() => LoginPage());
    return false;
  }
}