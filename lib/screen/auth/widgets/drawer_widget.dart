import 'package:capstone_front/screen/auth/authPages/login_page.dart';
import 'package:capstone_front/screen/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    
    return Container(
      width: MediaQuery.of(context).size.width - 120, // drawer width 크기조절
      child: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1.5)),
                child: Row(children: [Text('DrawerHeadeasddr')]),
              ),
              decoration: BoxDecoration(color: Colors.grey[400]),
              padding: const EdgeInsets.all(30), // 검은테두리 밖의 회색영역
              margin: const EdgeInsets.all(10), // 흰색 영역
            ),
            Flexible(
              child: Container(
                color: Colors.blue,
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.green,
                child: SubmitButton(
                  title: '로그인',
                  onPressed:() async {
                    final SharedPreferences? prefs = await _prefs;
                    prefs?.clear();
                    Get.offAll(LoginPage());
                  },
                )
              ),
            ),
          ],
        )
      ),
    );
  }
}