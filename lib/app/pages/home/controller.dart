import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  final Rx<CarouselSliderController> sliderController =
      CarouselSliderController().obs;
  RxInt currentSlide = 0.obs;
}
