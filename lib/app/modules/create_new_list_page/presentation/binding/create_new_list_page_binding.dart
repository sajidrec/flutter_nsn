import 'package:get/get.dart';

import '../controller/create_new_list_page_controller.dart';

class CreateNewListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateNewListPageController(), fenix: true);
  }
}
