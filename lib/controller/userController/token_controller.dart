import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class tokenController extends GetxController{
  
  Future<void> getTokens() async{  
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  
    final String? accessToken = prefs.getString('token');
    final String? refreshToken = prefs.getString('refreshToken');

    if(accessToken != null) {
      
    }

  }

}