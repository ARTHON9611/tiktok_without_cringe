import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:tiktok_without_cringe/controller/video_controller.dart';
import 'package:tiktok_without_cringe/views/widgets/circel_Animation.dart';
import 'package:tiktok_without_cringe/views/widgets/video_player.dart';

class videoScreen extends StatelessWidget {
  videoScreen({super.key});
  final videoController controller = Get.put(videoController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    buildMusicAlbum(String photoUrl) {
      return SizedBox(
        width: 50,
        height: 50,
        child: Container(
          padding: EdgeInsets.all(11),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              gradient:
                  const LinearGradient(colors: [Colors.grey, Colors.white]),
              borderRadius: BorderRadius.circular(25)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image(
              image: NetworkImage(photoUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    buildProfile(String photoUrl) {
      return SizedBox(
        width: 60,
        height: 60,
        child: Stack(children: [
          Positioned(
              left: 5,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: NetworkImage(photoUrl),
                      fit: BoxFit.cover,
                    )),
              ))
        ]),
      );
    }

    return Scaffold(body: Obx(() {
      Get.snackbar('error occured', '');
      return PageView.builder(
          itemCount: controller.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final info = controller.videoList[index];

            return Stack(
              children: [
                videoPlayer(
                    videoUrl:
                        // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
                        info.videoUrl),
                Column(
                  children: [
                    const SizedBox(height: 100),
                    Expanded(
                        child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  info.username,
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  info.caption,
                                  style: TextStyle(fontSize: 16),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.music_note,
                                      size: 20,
                                    ),
                                    Text(info.songName)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                            width: 100,
                            margin: EdgeInsets.only(
                                top: size.height / 3.5, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                buildProfile(info.imgUrl),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            Fluttertoast.showToast(
                                                msg: 'Button tapped');
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            size: 35,
                                            color: Colors.red,
                                          )),
                                      Text(
                                        "2,200",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Fluttertoast.showToast(
                                                msg: 'Button tapped');
                                          },
                                          child: Icon(
                                            Icons.comment,
                                            size: 35,
                                          )),
                                      Text("2"),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Fluttertoast.showToast(
                                                msg: 'Button tapped');
                                          },
                                          child: Icon(
                                            Icons.reply,
                                            size: 35,
                                          )),
                                      Text("2")
                                    ],
                                  ),
                                ),
                                circleAnimation(
                                    child: buildMusicAlbum(info.imgUrl))
                              ],
                            )),
                      ],
                    ))
                  ],
                )
              ],
            );
          });
    }));
  }
}
