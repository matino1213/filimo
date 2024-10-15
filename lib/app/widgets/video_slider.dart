import 'package:carousel_slider/carousel_slider.dart';
import 'package:filimo/app/common/app_route.dart';
import 'package:filimo/app/constants.dart';
import 'package:filimo/app/pages/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/video_slide.dart';

class VideoSlider extends GetView<HomeController> {
  const VideoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            CarouselSlider(
              items: videoImages,
              carouselController: controller.sliderController.value,
              options: CarouselOptions(
                  height: Get.height,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    controller.currentSlide.value = index;
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
              child: AnimatedSmoothIndicator(
                activeIndex: controller.currentSlide.value,
                count: videoImages.length,
                axisDirection: Axis.horizontal,
                effect: const WormEffect(
                  spacing: 8.0,
                  radius: 10.0,
                  dotWidth: 14.0,
                  dotHeight: 14.0,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 1.5,
                  dotColor: Colors.white,
                  activeDotColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Widget> videoImages = images.map((item) {
  return Stack(
    children: [
      Positioned(
        top: 0,
        right: 0,
        left: 0,
        child: Image.asset(
          item.imageAddress,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kBackgroundColor,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          width: Get.width,
          height: Get.height,
        ),
      ),
      Positioned(
        bottom: 60,
        right: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: fTitleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              item.subtitle,
              style: fTextStyle,
            ),
            const SizedBox(
              height: 15,
            ),
            Material(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                onTap: () {
                  Get.toNamed(
                    AppRoute.VIDEO,
                    arguments: item,
                  );
                },
                child: SizedBox(
                  height: 40,
                  width: 140,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.black,
                        ),
                        Text(
                          'اطلاعات بیشتر',
                          style: fTitleStyle.copyWith(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}).toList();
