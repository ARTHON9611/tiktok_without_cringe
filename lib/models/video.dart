import 'package:cloud_firestore/cloud_firestore.dart';

class Video{
 String username;
 String uid;
 String id;
 String imgUrl;
 String videoUrl;
 String songName;
 String caption;
 String thumbnail;
 List likes;
 int commentCount;
 int shareCount;

 Video({required this.caption,required this.commentCount,required this.id,required this.likes,required this.shareCount,required this.songName,required this.thumbnail,required this.uid,required this.username,required this.videoUrl,required this.imgUrl});

 Map<String,dynamic> toJson(){

  return {'username':username,'uid':uid,'id':id,'videoUrl':videoUrl,'songName':songName,'caption':caption,'thumbnail':thumbnail,'likes':likes,'commentCount':commentCount,'shareCount':shareCount,'imgUrl':imgUrl};

 }

 static Video fromSnap(DocumentSnapshot snap){
  var snapshot = snap.data() as Map<String,dynamic>;

  return Video(caption: snapshot['caption'],username: snapshot['username'],uid: snapshot['uid'], id: snapshot['id'],videoUrl: snapshot['videoUrl'],thumbnail: snapshot['thumbnail'],likes: snapshot['likes'],commentCount: snapshot['commentCount'],shareCount: snapshot['shareCount'],songName: snapshot['songName'],imgUrl: snapshot['imgUrl']
  );
}}