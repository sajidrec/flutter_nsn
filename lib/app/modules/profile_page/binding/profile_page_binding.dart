import 'package:get/get.dart';
import 'package:nsn/app/modules/profile_page/controller/profile_page_controller.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfilePageController(), fenix: true);

  }
}
