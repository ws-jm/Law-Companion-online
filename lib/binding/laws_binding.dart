import 'package:get/get.dart';
import '../controller/laws/laws_1_controller.dart';
import '../controller/laws/laws_controller.dart';

class LawsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LawsController());
    Get.lazyPut(() => Laws1Controller(Get.find(),Get.find()));
  }
}