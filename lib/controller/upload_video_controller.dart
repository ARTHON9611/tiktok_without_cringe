import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiktok_without_cringe/constants.dart';
import 'package:tiktok_without_cringe/models/video.dart';
import 'package:video_compress/video_compress.dart';

class uploadVideoController extends GetxController {
  //uplad video function

  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  _compressVideoPath(String vdoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(vdoPath,
        quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }

  Future<String> _uploadVideoTStorage(String id, String vdoFile) async {
    Reference ref = firebaseStrage.ref().child('Videos').child(id);
    UploadTask uploadTask = ref.putFile(await _compressVideoPath(vdoFile));
    TaskSnapshot snap = await uploadTask;
    String downloadURL = await snap.ref.getDownloadURL();
    return downloadURL;
  }

  _uploadImageToStorage(String id, String vdoFile) async {
    Reference ref = firebaseStrage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbnail(vdoFile));
    TaskSnapshot snap = await uploadTask;
    String downloadURL = await snap.ref.getDownloadURL();
    return downloadURL;
  }

  uploadVideo(
      {required String musicName,
      required String captionName,
      required String videoPath}) async {
    try {
      String uid = await firebaseAuth.currentUser!.uid;

      DocumentSnapshot snap =
          await firestore.collection('users').doc(uid).get();
      var allSnaps = await firestore.collection('videos').get();
      int len = allSnaps.docs.length;

      String videoUrl = await _uploadVideoTStorage('Video $len', videoPath);
      String thumnailUrl = await _uploadImageToStorage('Video $len', videoPath);

      Video video = Video(
          caption: captionName,
          commentCount: 0,
          id: 'Video $len',
          likes: [],
          shareCount: 0,
          songName: musicName,
          thumbnail: thumnailUrl,
          uid: uid,
          username: (snap.data() as Map<String, dynamic>)['name'],
          videoUrl: videoUrl,
          imgUrl: (snap.data() as Map<String, dynamic>)['profilePic']);
      await firestore
          .collection('videos')
          .doc('video $len')
          .set(video.toJson());
      Fluttertoast.showToast(msg: "Video uploaded successfully");
      //Get.snackbar('Uploaded Successfully','video uploaded with captionname: $captionName');
      Get.back();
    } catch (e) {
      Get.snackbar('Error Uploading', e.toString());
    }
  }
}
