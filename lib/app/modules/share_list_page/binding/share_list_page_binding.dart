import 'package:get/get.dart';
import 'package:nsn/app/modules/share_list_page/controllers/share_list_page_controller.dart';

class ShareListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareListPageController(), fenix: true);
  }
}
