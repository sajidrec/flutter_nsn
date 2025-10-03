import 'package:get/get.dart';

import '../controller/signup_page_controller.dart';

class SignupPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupPageController(), fenix: true);
  }
}
