import 'package:get/get.dart';
import 'package:nsn/app/modules/verification_code_page/presentation/view/verification_code_page.dart';

class VerificationCodePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationCodePage(), fenix: true);
  }
}
