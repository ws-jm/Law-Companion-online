import 'package:ftv2/controller/rules/rules_1_controller.dart';
import 'package:get/get.dart';
import '../controller/rules/rules_controller.dart';

class RulesBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RulesController());
    Get.lazyPut(() => Rules1Controller(Get.find(),Get.find()));
  }
}