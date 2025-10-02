import 'package:get/get.dart';

class SignupPageController extends GetxController {
  bool userAgreed = false;

  void toggleUserAgree() {
    userAgreed = !userAgreed;
    update();
  }
}
