import 'package:filimo/app/widgets/video_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/video_slide.dart';
import '../constants.dart';

class SecondSlider extends StatelessWidget {
  const SecondSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Text(
                'خفن ترین ها',
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
        SizedBox(
          height: 300,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 250,
                        width: 150,
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
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 5,
                        ),
                        child: Text(
                          video.title,
                          style: fTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 5,
                        ),
                        child: Text(
                          video.subtitle,
                          style: fTextStyle.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
