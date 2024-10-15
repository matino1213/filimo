import 'package:filimo/app/pages/home/controller.dart';
import 'package:filimo/app/pages/show_video/controller.dart';
import 'package:filimo/app/pages/video/controller.dart';
import 'package:get/get.dart';

import '../pages/splash/controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
    Get.put<HomeController>(HomeController());
    Get.lazyPut<VideoController>(() => VideoController(), fenix: true);
    Get.lazyPut<ShowVideoController>(() => ShowVideoController(), fenix: true);
  }
}
