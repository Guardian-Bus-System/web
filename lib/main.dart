import 'package:capstone_front/routes/mainView.dart';
import 'package:capstone_front/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/admin/adminScreen/adminMainPage.dart';
import 'package:capstone_front/screen/user/auth/cerfication_page.dart';
import 'package:capstone_front/screen/user/auth/login_page.dart';
import 'package:capstone_front/screen/user/pages/changeBusRoute_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    ScreenSize screen = ScreenSize(context);

    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('ko', 'KR')],
      locale: const Locale('ko'),
      title: 'GBSW-GOBUS',
      home: screen.width < 600 //가로넓이가 600이하라면 앱을 보여주고, 그 외에는 관리자 페이징 처리
          ? MainView()
          : AdminMainPage(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MainView()),
        GetPage(
          name: '/notification',
          page: () => const NotificationScreen(),
          transition: Transition.downToUp
        ),
        GetPage(
          name: '/changePushRoute', 
          page: () => const ChangeBusRouteScreen()
        ),
        GetPage(
          name: '/notification/detail',
          page: () => const NotificationDetailWidget(
              noticeText: '임시공지입니다.',
              dateTime: 'yyyy-mm--dd',
            )
        ),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/cerfication', page: () => const CerficationPage()),
      ],
    );
  }
}
