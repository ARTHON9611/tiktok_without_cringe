import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userName;
  final String email;
  final String uid;
  final String profilePic;

  User(
      {required this.email,
      required this.uid,
      required this.profilePic,
      required this.userName});

  Map<String, dynamic> toJson() {
    return {
      'name': userName,
      'email': email,
      'uid': uid,
      'profilePic': profilePic
    };
  }

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        email: snapshot['email'],
        profilePic: snapshot['profilePic'],
        uid: snapshot['uid'],
        userName: snapshot['name']);
  }
}
