import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_without_cringe/constants.dart';
import 'package:tiktok_without_cringe/models/video.dart';

class videoController extends GetxController {
  Rx<List<Video>> _videoList = Rx([]);

  List<Video> get videoList => _videoList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _videoList.bindStream(
        firestore.collection('videos').snapshots().map((QuerySnapshot query) {
          List<Video> retVal=[];
          for(var element in query.docs){
            retVal.add(Video.fromSnap(element));
          }
          return retVal;
        }));
  }
}
