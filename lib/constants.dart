import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_without_cringe/controller/auth_controller.dart';
import 'package:tiktok_without_cringe/controller/upload_video_controller.dart';
import 'package:tiktok_without_cringe/views/screens/add_video_Screen.dart';
import 'package:tiktok_without_cringe/views/screens/video_screen.dart';

List Pages = [
  videoScreen(),
  Text("Search"),
  const addVdoScreen(),
  Text("Messages"),
  Text("Profile"),
];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

//Firebase

var firebaseAuth = FirebaseAuth.instance;
var firebaseStrage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;
var uploadMedia = uploadVideoController();

//controller

var authController = AuthController.instance;
