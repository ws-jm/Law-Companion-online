import 'package:get/get.dart';
import '../controller/cases_detail_controller.dart';

class CasesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CasesDetailController());
  }

}