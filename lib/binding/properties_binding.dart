import 'package:get/get.dart';

import '../controller/properties_controller.dart';

class PropertiesBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PropertiesController(Get.find(),Get.find()));
  }
}