import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tiktok_without_cringe/views/widgets/video_player.dart';

class videoScreen extends StatelessWidget {
  const videoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
        itemCount: 10,
        controller: PageController(initialPage: 0,viewportFraction: 1),
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index){
        return Stack(
        children: [
          //videoPlayer(videoUrl: ""),
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
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            ' Username',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            ' Caption',
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.music_note,
                                size: 20,
                              ),
                              Text("Song name")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    margin: EdgeInsets.only(top:size.height/3,right: 5),
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(onTap: (){Fluttertoast.showToast(msg: 'Button tapped');},child: Icon(Icons.heart_broken,size: 35,color: Colors.red,)),
                      InkWell(onTap: (){Fluttertoast.showToast(msg: 'Button tapped');},child: Icon(Icons.comment,size: 35,)),
                      InkWell(onTap: (){Fluttertoast.showToast(msg: 'Button tapped');},child: Icon(Icons.description,size: 35,)),
                      InkWell(onTap: (){Fluttertoast.showToast(msg: 'Button tapped');},child: Icon(Icons.share_rounded,size: 35,)),
                      InkWell(onTap: (){Fluttertoast.showToast(msg: 'Button tapped');},child: Icon(Icons.info,size: 35,))
                    ],
                  )),
                ],
              ))
            ],
          )
        ],
      );
      })
    );
  }
}
