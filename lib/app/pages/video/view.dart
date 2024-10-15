import 'package:filimo/app/common/app_route.dart';
import 'package:filimo/app/constants.dart';
import 'package:filimo/app/pages/video/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPage extends GetView<VideoController> {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: kBackgroundColor,
            expandedHeight: 450,
            title: Row(
              children: [
                Obx(
                  () => AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: controller.opacity.value,
                    child: Text(
                      controller.video.title,
                      style: fTitleStyle.copyWith(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cloud_download_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  SizedBox(
                    height: 450,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            foregroundDecoration: BoxDecoration(
                              color: kBackgroundColor.withOpacity(0.5),
                            ),
                            child: Image.asset(
                              controller.video.imageAddress,
                              height: 270,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 155,
                          right: 20,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 220,
                                width: 150,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  child: Image.asset(
                                    controller.video.imageAddress,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    controller.video.title,
                                    style: fTitleStyle.copyWith(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.5,
                                    child: Text(
                                      controller.video.subtitle,
                                      style: fTextStyle.copyWith(
                                          color: Colors.white70),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 130,
                          left: 20,
                          child: Material(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            color: kGreenColor,
                            child: InkWell(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                              onTap: () {
                                Get.toNamed(
                                  AppRoute.SHOWVIDEO,
                                  arguments: controller.video,
                                );
                              },
                              child: const SizedBox(
                                height: 35,
                                width: 200,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.play_arrow_rounded,
                                    ),
                                    Text(
                                      'تماشای رایگان ایرانسلی',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          left: 20,
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.thumb_up_alt_rounded,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.thumb_down_alt_rounded,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                          bottom: 0,
                          right: 10,
                          left: 10,
                          child: Divider(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'جنازه ی بچه ای که صورتش متلاشی شده در شهر پیدا میشود و کارآگاه کیانی از کاوه میخواهد برای تشخیص هویت به آنج'
                    'ا بیاید ...',
                    style: fTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
