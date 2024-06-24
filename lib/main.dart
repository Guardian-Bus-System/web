import 'package:capstone_front/model/UserModel.dart';
import 'package:capstone_front/model/data.dart';
import 'package:capstone_front/routes/mainView.dart';
import 'package:capstone_front/screen/admin/adminScreen/adminMainPage.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/user/auth/login_page.dart';
import 'package:capstone_front/screen/user/pages/home_screen.dart';
import 'package:capstone_front/screen/user/pages/notification_screen.dart';
import 'package:capstone_front/screen/user/widget/notification/notificationDetailWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:url_strategy/url_strategy.dart';
import 'CustomSide/responsive_screen_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
    DeviceOrientation.portraitDown,
  ]);
  setPathUrlStrategy();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  
  MyApp({super.key});
  Rx<UserData> userData = userdata;

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
      title: 'GBSW-GOBUS',
      home: screen.width < 600 //가로넓이가 600이하라면 앱을 보여주고 아니면 그냥 흰 바탕 
        ? HomeView(user: userData)//ChangeBusRouteScreen(data: userdata)
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