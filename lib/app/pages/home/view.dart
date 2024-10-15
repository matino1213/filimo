import 'package:filimo/app/constants.dart';
import 'package:filimo/app/pages/home/controller.dart';
import 'package:filimo/app/widgets/slider.dart';
import 'package:filimo/app/widgets/video_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/special_slider.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 480,
            backgroundColor: kBackgroundColor,
            title: Row(
              children: [
                Image.asset(
                  'assets/images/filimo.png',
                  height: 30,
                ),
                const Spacer(),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: kLightYellowColor,
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.local_fire_department_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            flexibleSpace: const FlexibleSpaceBar(
              background: VideoSlider(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SpecialSlider(),
                const SecondSlider(),
                const SecondSlider(),
                const SecondSlider(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/filimo_logo_transparent.png',
                width: 28,
              ),
              label: 'ویترین',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              label: 'دسته بندی',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.videocam,
              ),
              label: 'فیلم های من',
            ),
          ],
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
          backgroundColor: kBackgroundColor,
          showUnselectedLabels: false,
          selectedItemColor: kYellowColor,
          currentIndex: controller.currentIndex.value,
          onTap: (value) {
            controller.currentIndex.value = value;
          },
        ),
      ),
    );
  }
}
