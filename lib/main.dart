import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tiktok_without_cringe/constants.dart';
import 'package:tiktok_without_cringe/controller/auth_controller.dart';
import 'package:tiktok_without_cringe/views/screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  await DefaultCacheManager().emptyCache();
  var appDir = (await getTemporaryDirectory()).path;
  new Directory(appDir).delete(recursive: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TikTok',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: loginScreen(),
    );
  }
}
