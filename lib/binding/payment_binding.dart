import 'package:ftv2/controller/payment_controller.dart';
import 'package:get/get.dart';


class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PaymentController(Get.find(),Get.find()));
  }

}