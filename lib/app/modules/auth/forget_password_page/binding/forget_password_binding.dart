import 'package:get/get.dart';

import '../controllers/forget_password_page_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordPageController(), fenix: true);
  }
}
