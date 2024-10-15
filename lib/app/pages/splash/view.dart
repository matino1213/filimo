import 'package:filimo/app/pages/splash/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.black,
        child: Center(
          child: Image.asset(
            'assets/images/filimo_logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
