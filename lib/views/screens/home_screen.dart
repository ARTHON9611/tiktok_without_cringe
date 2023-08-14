import 'package:flutter/material.dart';
import 'package:tiktok_without_cringe/constants.dart';
import 'package:tiktok_without_cringe/views/widgets/custom_icon.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
  
}

class _homeScreenState extends State<homeScreen> {
   int page=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Container(child: Pages[page],)),
    bottomNavigationBar: BottomNavigationBar(onTap: (index){setState(() {
      page=index;
    });},currentIndex: page,type: BottomNavigationBarType.fixed,backgroundColor: backgroundColor,selectedItemColor: Colors.red,unselectedItemColor: Colors.white,showUnselectedLabels: true,items: [BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),BottomNavigationBarItem(icon:customIcon(),label: ''),BottomNavigationBarItem(icon: Icon(Icons.message),label: "Messages"),BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Profile")]),);
  }
}