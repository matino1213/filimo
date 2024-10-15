import 'package:chewie/chewie.dart';
import 'package:filimo/models/video_slide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ShowVideoController extends GetxController {
  VideoSlide video = Get.arguments;
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  Future<void> initializePlayer() async {
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(video.url),
    );
    await Future.wait([videoPlayerController.initialize()]);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      autoInitialize: true,
      materialProgressColors: ChewieProgressColors(
        backgroundColor: Colors.grey,
        bufferedColor: Colors.grey.shade200,
        playedColor: Colors.yellowAccent,
      ),
    );
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializePlayer();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    videoPlayerController.dispose();
    chewieController!.dispose();
  }
}
