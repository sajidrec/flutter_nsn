import 'package:get/get.dart';

import '../controllers/bounties_page_controller.dart';

class BountiesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(fenix: true, () => BountiesPageController());
  }
}
