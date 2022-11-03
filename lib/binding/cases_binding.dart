import 'package:ftv2/controller/cases_controller.dart';
import 'package:get/get.dart';

class CasesBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CasesController(Get.find(),Get.find()));
  }

}