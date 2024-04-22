import 'package:capstone_front/screen/CustomSide/color_theme.dart';
import 'package:capstone_front/screen/auth/authPages/login_page.dart';
import 'package:capstone_front/screen/pages/home_screen.dart';
import 'package:capstone_front/screen/pages/notification_screen.dart';
import 'package:capstone_front/screen/widget/notification/notificationDetailWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      home: HomeScreen(),
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

