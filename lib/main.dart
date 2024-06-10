import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/routes/mainView.dart';
import 'package:capstone_front/screen/admin/adminScreen/adminMainPage.dart';
import 'package:capstone_front/screen/user/pages/profile_screen.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/user/auth/login_page.dart';
import 'package:capstone_front/screen/user/pages/home_screen.dart';
import 'package:capstone_front/screen/user/pages/notification_screen.dart';
import 'package:capstone_front/screen/user/widget/notification/notificationDetailWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import 'CustomSide/responsive_screen_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  
  MyApp({super.key});
  late Rx<UserData> userdata = 
    UserData(
      id: '',pw: '', loginId: 'loginId',
      grade: 1, classNumber: 1, number: 0,  
      name: '홍길동', 
      roles: [], authorities: [], 
      timestamp: ''
    ).obs; // userdata를 Rx 형태로 선언

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return GetMaterialApp(
      theme: ThemeData( scaffoldBackgroundColor: backgroundColor ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('ko', 'KR')
      ],
      locale: const Locale('ko'),
      title: 'Flutter Demo',
      home: screen.width < 600 //가로넓이가 600이하라면 앱을 보여주고 아니면 그냥 흰 바탕 
        ? HomeView(user: userdata)
        : const AdminMainPage(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/notification', page: () => const NotificationScreen(), transition: Transition.downToUp),
        GetPage(name: '/notification/detail', page: () => const NotificationDetailWidget()),  
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/certication', page: () => const NotificationScreen()),
      ],
    );
  }
}