import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiktok_without_cringe/constants.dart';
import 'package:tiktok_without_cringe/controller/upload_video_controller.dart';
import 'package:tiktok_without_cringe/views/widgets/text_input_field.dart';
import 'package:cached_video_player/cached_video_player.dart';

class confirmationScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const confirmationScreen(
      {super.key, required this.videoFile, required this.videoPath});

  @override
  State<confirmationScreen> createState() => _confirmationScreenState();
}

class _confirmationScreenState extends State<confirmationScreen> {
  late CachedVideoPlayerController controller;
  TextEditingController songController = new TextEditingController();
  TextEditingController captionController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = CachedVideoPlayerController.file(widget.videoFile);
    setState(() {
      controller.initialize();
      controller.play();
      controller.setVolume(1);
      controller.setLooping(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width - 20,
              child: CachedVideoPlayer(controller),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: textInputField(
                        icon: Icons.music_note,
                        labelText: 'Music',
                        controller: songController,
                        Text: {})),
                Container(
                    width: MediaQuery.of(context).size.width - 20,
                    child: textInputField(
                        icon: Icons.closed_caption,
                        labelText: 'Caption',
                        controller: captionController,
                        Text: {})),
                ElevatedButton(
                    onPressed: () {
                      uploadMedia.uploadVideo(
                          musicName: "",
                          captionName: "",
                          videoPath: widget.videoPath);
                    },
                    child: Icon(Icons.share))
              ],
            ),
          )
        ],
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
