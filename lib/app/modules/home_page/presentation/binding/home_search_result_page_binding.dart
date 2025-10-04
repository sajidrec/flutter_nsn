import 'package:get/get.dart';
import 'package:nsn/app/modules/home_page/presentation/controllers/home_search_result_page_controller.dart';

class HomeSearchResultPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(fenix: true, () => HomeSearchResultPageController());
  }
}
