import 'package:chewie/chewie.dart';
import 'package:filimo/app/pages/show_video/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowVideoPage extends GetView<ShowVideoController> {
  const ShowVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<ShowVideoController>(
          builder: (videoController) {
            if (videoController.chewieController != null &&
                videoController.videoPlayerController.value.isInitialized) {
              return AspectRatio(
                aspectRatio: videoController.videoPlayerController.value.aspectRatio,
                child: Chewie(
                  controller: videoController.chewieController!,
                ),
              );
            } //
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          init: ShowVideoController(),
        ),
      ),
    );
  }
}
