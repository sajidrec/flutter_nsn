import 'package:get/get.dart';

class ForgetPasswordPageController extends GetxController {
  bool disableButton = true;

  @override
  void onInit() {
    super.onInit();
    disableButton = true;
  }

  void setDisabledButton(bool state) {
    disableButton = state;
    update();
  }
}
