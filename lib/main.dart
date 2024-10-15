import 'package:filimo/app/common/app_route.dart';
import 'package:filimo/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/common/app_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      defaultTransition: Transition.native,
      title: 'Flutter Demo',
      locale: const Locale('fa','IR'),
      fallbackLocale: const Locale('en','US'),
      theme: ThemeData(
        fontFamily: 'IranSans',
        scaffoldBackgroundColor: kBackgroundColor,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      getPages: AppRoute.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.SPLASH,
    );
  }
}
