import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  Widget buildVideoPlayer() => VideoPlayer(controller);
  Widget buildVideo() => buildVideoPlayer();

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? Center(
            child: buildVideo(),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
