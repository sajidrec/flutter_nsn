import 'package:get/get.dart';
import 'package:nsn/app/modules/login_page/presentation/controllers/login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController(), fenix: true);
  }
}
