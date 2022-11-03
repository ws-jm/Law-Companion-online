import 'package:ftv2/controller/upload_advert_controller.dart';
import 'package:get/get.dart';

class UploadAdvertBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UploadAdvertController(Get.find(),Get.find()));
  }

}