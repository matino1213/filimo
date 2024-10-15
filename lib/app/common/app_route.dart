import 'package:filimo/app/pages/home/view.dart';
import 'package:filimo/app/pages/show_video/view.dart';
import 'package:filimo/app/pages/splash/view.dart';
import 'package:filimo/app/pages/video/view.dart';
import 'package:get/get.dart';

class AppRoute {
  static const SPLASH = "/Splash";
  static const HOME = "/Home";
  static const VIDEO = "/Video";
  static const SHOWVIDEO = "/ShowVideo";
  static List<GetPage> routes = [
    GetPage(
      name: AppRoute.SPLASH,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoute.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoute.VIDEO,
      page: () => const VideoPage(),
    ),
    GetPage(
      name: AppRoute.SHOWVIDEO,
      page: () => const ShowVideoPage(),
    ),
  ];
}
