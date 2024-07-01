import 'package:shared_preferences/shared_preferences.dart';
import 'package:capstone_front/screen/user/auth/login_page.dart';
import 'package:get/get.dart';

Future<bool> checkTokens() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final String? accessToken = prefs.getString('token');
  final String? refreshToken = prefs.getString('refreshToken');
  
  if (accessToken != null &&  refreshToken != null) {
    return true;
  } else if (accessToken != null) {
    return true;
  } else {
    // ignore: avoid_print
    print("token is null");
    Get.to(() => const LoginPage());
    return false;
  }
}