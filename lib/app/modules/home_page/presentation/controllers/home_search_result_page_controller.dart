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
