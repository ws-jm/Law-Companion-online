import 'package:get/get.dart';
import '../controller/rules/chapter_detail_controller.dart';

class ChapterDetailsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ChapterDetailController());
  }

}