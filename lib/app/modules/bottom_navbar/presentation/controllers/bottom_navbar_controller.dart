import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsn/app/modules/bounties_page/presentation/views/bounties_page.dart';
import 'package:nsn/app/modules/home_page/presentation/views/home_page.dart';
import 'package:nsn/app/modules/my_list_page/presentation/views/my_list_page.dart';

class BottomNavbarController extends GetxController {
  List<Widget> pages = [
    HomePage(),
    MyListPage(),
    BountiesPage(),
    Center(child: Text("Profile")),
  ];

  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    update();
  }
}
