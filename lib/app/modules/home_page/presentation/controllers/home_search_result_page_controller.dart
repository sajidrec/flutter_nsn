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

  int totalSelectedItems = 0;

  bool selectMultipleMode = false;

  Map<int, bool> itemCheckedList = {};

  void toggleItemChecked(int index) {
    if (itemCheckedList[index] ?? false) {
      totalSelectedItems--;
    } else {
      totalSelectedItems++;
    }

    itemCheckedList[index] = !(itemCheckedList[index] ?? false);

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

    totalSelectedItems = 0;

    itemCheckedList.forEach((key, value) {
      if (value) {
        totalSelectedItems++;
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
