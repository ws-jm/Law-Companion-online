import 'package:ftv2/controller/search%20History_controller.dart';
import 'package:get/get.dart';

class SearchHistoryBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SearchHistoryController(Get.find(),Get.find()));
  }

}