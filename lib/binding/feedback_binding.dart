import 'package:ftv2/controller/feedback_controller.dart';
import 'package:get/get.dart';

class FeedBackBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => FeedBackController(Get.find(),Get.find()));
  }

}