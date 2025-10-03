import 'package:get/get.dart';

class LoginPageController extends GetxController {
  bool rememberMe = false;

  bool hidePassword = false;

  void toggleRememberMe() {
    rememberMe = !rememberMe;
    update();
  }

  void togglePassword() {
    hidePassword = !hidePassword;
    update();
  }
}
