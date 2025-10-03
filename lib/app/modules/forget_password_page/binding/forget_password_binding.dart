import 'package:get/get.dart';
import 'package:nsn/app/modules/forget_password_page/controllers/forget_password_page_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordPageController(), fenix: true);
  }
}
