

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hiteshsapra/splash/splash_screen.dart';
import 'package:hiteshsapra/theme/theme_controller.dart';
import 'dashboard/dashboard_controller.dart';
import 'dashboard/dashboard_screen.dart';
import 'splash/splash_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    final ThemeData lightTheme = ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFFF75023),
        secondaryHeaderColor: const Color(0xFFF4F4F2),
        scaffoldBackgroundColor: const Color(0xFFffffff),
        highlightColor: const Color(0xFF000000),
        hoverColor: const Color(0xFFb8b5c8),
        textTheme: const TextTheme(
          titleSmall: TextStyle(
              fontSize: 20,
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold,
              fontFamily: 'HelveticaRegular'),
          titleMedium: TextStyle(
              fontSize: 20,
              color: Color(0xFFF75023),
              fontWeight: FontWeight.bold,
              fontFamily: 'HelveticaRegular'),
        ));

    final ThemeData darkTheme = ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFFF75023),
        secondaryHeaderColor: const Color(0xFF404453),
        scaffoldBackgroundColor: const Color(0xFF2b2d33),
        highlightColor: const Color(0xFFffffff),
        hoverColor: const Color(0xFFb8b5c8),
        textTheme: const TextTheme(
          titleSmall: TextStyle(
              fontSize: 20,
              color: Color(0xFFffffff),
              fontWeight: FontWeight.bold,
              fontFamily: 'HelveticaRegular'),
          titleMedium: TextStyle(
              fontSize: 20,
              color: Color(0xFFF75023),
              fontWeight: FontWeight.bold,
              fontFamily: 'HelveticaRegular'),
        ));
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tanmay Mishra',
        darkTheme: darkTheme,
        theme: lightTheme,
        themeMode: themeController.themeMode.value,
        initialBinding: InitialBinding(),
        initialRoute: '/dashboard',
        getPages: [
          ///Lunch Screen
          GetPage(name: '/dashboard', page: () => const DashboardScreen()),

          /// main screen
        ],
      ),
    );
  }
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(SplashController());
    Get.put(DashboardController());
  }
}
