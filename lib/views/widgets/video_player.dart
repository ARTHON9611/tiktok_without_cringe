import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class videoPlayer extends StatefulWidget {
  final String videoUrl;
  const videoPlayer({super.key, required this.videoUrl});

  @override
  State<videoPlayer> createState() => _videoPlayerState();
}

class _videoPlayerState extends State<videoPlayer> {
  CachedVideoPlayerController? videoPlayerController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = CachedVideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController?.play();
        videoPlayerController?.setVolume(1);
        videoPlayerController?.setLooping(true);
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        videoPlayerController!.value.isPlaying
            ? videoPlayerController!.pause()
            : videoPlayerController!.play();
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CachedVideoPlayer(videoPlayerController!),
      ),
    );
  }
}
