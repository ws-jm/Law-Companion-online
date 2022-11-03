import 'package:ftv2/controller/badge_controller.dart';
import 'package:get/get.dart';

class BadgeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BadgeController(Get.find(),Get.find()));
  }

}