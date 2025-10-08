import 'package:get/get.dart';
import 'package:nsn/app/modules/my_list_page/presentation/controllers/my_list_page_controller.dart';

class MyListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(fenix: true, () => MyListPageController());
  }
}
