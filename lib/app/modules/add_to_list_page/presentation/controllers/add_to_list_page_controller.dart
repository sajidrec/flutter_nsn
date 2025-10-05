import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToListPageController extends GetxController {
  final TextEditingController titleTEC = TextEditingController();
  final TextEditingController niinOrMcnTEC = TextEditingController();
  final TextEditingController modelNoTEC = TextEditingController();
  final TextEditingController linTEC = TextEditingController();
  final TextEditingController nsnTEC = TextEditingController();
  final TextEditingController eicTEC = TextEditingController();
  final TextEditingController manualNoTEC = TextEditingController();

  @override
  void onClose() {
    titleTEC.dispose();
    niinOrMcnTEC.dispose();
    modelNoTEC.dispose();
    linTEC.dispose();
    nsnTEC.dispose();
    eicTEC.dispose();
    manualNoTEC.dispose();
    super.onClose();
  }
}
