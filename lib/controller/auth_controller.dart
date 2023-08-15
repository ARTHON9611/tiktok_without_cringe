import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tiktok_without_cringe/constants.dart';
import 'package:tiktok_without_cringe/models/user.dart' as model;
import 'package:tiktok_without_cringe/views/screens/auth/login_screen.dart';
import 'package:tiktok_without_cringe/views/screens/auth/sign_up_screen.dart';
import 'package:tiktok_without_cringe/views/screens/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialState);
    //ever(_user,_setInitialState);
  }

  _setInitialState(User? user) {
    if (user == null) {
      print("signupscreen");
      Get.offAll(() => loginScreen());
    } else {
      print("signupscreen else part");
      Get.offAll(() => homeScreen());
    }
  }

  Future<File> imgPicker() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Image Selected', 'Successfully');
    }
    return File(pickedImage!.path);
  }

  Future<String> _uploadToStorage(File image) async {
    Reference ref = await firebaseStrage
        .ref()
        .child('Profile Pics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    return await snap.ref.getDownloadURL();
  }

  void resgisterUser(
      {required String username,
      required String email,
      required String password,
      File? image}) async {
    try {
      if (email.isNotEmpty &&
          username.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        Get.snackbar('Account created', "Now you can proceed for login");
        String downloadUrl = await _uploadToStorage(image);

        model.User user = model.User(
            email: email,
            uid: credential.user!.uid,
            profilePic: downloadUrl,
            userName: username);

        await firestore.collection('users').doc(user.uid).set(user.toJson());
      } else {
        Get.snackbar('Error Occured', "Please fill  the details completely");
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error Occured', e.message.toString());
    }
  }

  void loginUser({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar('Login Success', 'Your account has been logged in');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error Logging In', e.message.toString().trim());
    }
  }
}
