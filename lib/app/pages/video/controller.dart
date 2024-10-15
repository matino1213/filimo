import 'package:filimo/models/video_slide.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VideoController extends GetxController{
  final VideoSlide video = Get.arguments;
  RxDouble opacity = 0.0.obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController.addListener(() {
      if(scrollController.offset > 370){
        opacity.value = 1.0;
      }//
      else{
        opacity.value = 0.0;
      }
    },);
  }
}