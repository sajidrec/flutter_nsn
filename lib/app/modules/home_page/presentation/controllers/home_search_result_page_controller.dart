import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSearchResultPageController extends GetxController {
  final searchTec = TextEditingController();

  final niinMcnTec = TextEditingController();
  final modelNoTec = TextEditingController();
  final nsnTec = TextEditingController();
  final linTec = TextEditingController();
  final eicTec = TextEditingController();
  final manualTec = TextEditingController();

  Map<String, bool> myListSelected = {};

  int totalSelectedSearchElements = 0;
  int totalSelectedListElements = 0;

  bool selectMultipleMode = false;

  Map<int, bool> itemCheckedList = {};
  Map<int, bool> myListCheckedList = {};

  void toggleItemChecked(int index) {
    if (itemCheckedList[index] ?? false) {
      totalSelectedSearchElements--;
    } else {
      totalSelectedSearchElements++;
    }

    itemCheckedList[index] = !(itemCheckedList[index] ?? false);

    update();
  }

  void toogleMyListChecked(int myListId) {
    if (myListCheckedList[myListId] ?? false) {
      totalSelectedListElements--;
    } else {
      totalSelectedListElements++;
    }
    myListCheckedList[myListId] = !(myListCheckedList[myListId] ?? false);

    update();
  }

  void toggleSelectMultipleMode() {
    selectMultipleMode = !selectMultipleMode;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    searchTec.text = Get.arguments['searchKeyword'];

    totalSelectedSearchElements = 0;
    totalSelectedListElements = 0;

    itemCheckedList.forEach((key, value) {
      if (value) {
        totalSelectedSearchElements++;
      }
    });

    update();
  }

  @override
  void onClose() {
    searchTec.dispose();
    super.onClose();
  }
}
