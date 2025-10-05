import 'package:get/get.dart';
import 'package:nsn/app/modules/add_to_list_page/presentation/controllers/add_to_list_page_controller.dart';

class AddToListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddToListPageController(), fenix: true);
  }
}
