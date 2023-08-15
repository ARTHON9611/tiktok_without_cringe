import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_without_cringe/constants.dart';
import 'package:tiktok_without_cringe/views/screens/confirmation_screen.dart';

class addVdoScreen extends StatelessWidget {
  const addVdoScreen({super.key});

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    String message = 'Video not choosen';
    if (video != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => confirmationScreen(
                    videoFile: File(video.path),
                    videoPath: video.path,
                  )));
    } else {
      if (src == ImageSource.camera) {
        message = 'Video not taken';
      }
      Get.snackbar('Media Not Selected', message);
    }
  }

  showDialogueOptions(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    pickVideo(ImageSource.gallery, context);
                  },
                  child: Row(children: const [
                    Icon(Icons.image),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Gallery ",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ]),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    pickVideo(ImageSource.camera, context);
                  },
                  child: Row(children: const [
                    Icon(Icons.camera_alt),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Camera ", style: TextStyle(fontSize: 20)),
                    )
                  ]),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(children: const [
                    Icon(Icons.cancel),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Cancel ", style: TextStyle(fontSize: 20)),
                    )
                  ]),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: () {
          showDialogueOptions(context);
        },
        child: Container(
          child: Center(
              child: Text(
            "Add Video",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          )),
          width: 180,
          height: 50,
          decoration: BoxDecoration(color: buttonColor),
        ),
      )),
    );
  }
}
