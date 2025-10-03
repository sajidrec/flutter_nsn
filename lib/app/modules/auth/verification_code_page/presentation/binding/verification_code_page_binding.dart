import 'package:get/get.dart';

import '../view/verification_code_page.dart';

class VerificationCodePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationCodePage(), fenix: true);
  }
}
