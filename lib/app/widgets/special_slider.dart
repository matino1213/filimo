import 'package:filimo/app/constants.dart';
import 'package:filimo/app/pages/home/controller.dart';
import 'package:filimo/app/widgets/video_slider.dart';
import 'package:filimo/models/video_slide.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SpecialSlider extends GetView<HomeController> {
  const SpecialSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Text(
                'ویژه',
                style: fTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                'مشاهده همه',
                style: fTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kLightYellowColor,
                ),
              ),
              Icon(
                CupertinoIcons.right_chevron,
                color: kLightYellowColor,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              VideoSlide video = images[index];
              return Row(
                children: [
                  Visibility(
                    visible: index == 0,
                    child: const SizedBox(
                      width: 10,
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          video.imageAddress,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
