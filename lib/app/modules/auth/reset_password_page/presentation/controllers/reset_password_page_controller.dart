import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordPageController extends GetxController {
  final Map<TextEditingController, bool> fieldEmptyMap = {};

  int get totalEmptyFields =>
      fieldEmptyMap.values.where((isEmpty) => isEmpty).length;

  void setFieldEmpty(TextEditingController tec, bool isEmpty) {
    fieldEmptyMap[tec] = isEmpty;
    update();
  }

  // Call this when you create your text fields
  void registerField(TextEditingController tec) {
    fieldEmptyMap[tec] = true; // start as empty
  }

  @override
  void onClose() {
    // dispose controllers if you own them
    for (final controller in fieldEmptyMap.keys) {
      controller.dispose();
    }
    super.onClose();
  }
}
