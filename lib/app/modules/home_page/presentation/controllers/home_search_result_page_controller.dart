import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSearchResultPageController extends GetxController {
  final searchTec = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    searchTec.text = Get.arguments['searchKeyword'];
  }

  @override
  void onClose() {
    searchTec.dispose();
    super.onClose();
  }
}
