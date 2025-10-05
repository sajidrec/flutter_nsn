import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateNewListPageController extends GetxController {
  final listNameTEC = TextEditingController();

  bool disableCreateNewListButton = true;

  @override
  void onInit() {
    super.onInit();
    listNameTEC.addListener(() {
      if (listNameTEC.text.isNotEmpty) {
        disableCreateNewListButton = false;
      } else {
        disableCreateNewListButton = true;
      }
      update();
    });
  }

  @override
  void onClose() {
    listNameTEC.dispose();
    super.onClose();
  }
}
