import 'package:ftv2/controller/citations_controller.dart';
import 'package:get/get.dart';

class CitationsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CitationsController());
  }

}