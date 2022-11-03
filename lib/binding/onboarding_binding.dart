import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => OnBoardingController(Get.find()));
  }

}