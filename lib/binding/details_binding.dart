import 'package:get/get.dart';

import '../controller/laws/detail_controller.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DetailController());
  }

}