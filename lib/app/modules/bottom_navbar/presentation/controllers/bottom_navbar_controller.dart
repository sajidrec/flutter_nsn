import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbarController extends GetxController {
  List<Widget> pages = [
    Center(child: Text("Home")),
    Center(child: Text("My List")),
    Center(child: Text("Bounties")),
    Center(child: Text("Profile")),
  ];

  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    update();
  }


}
