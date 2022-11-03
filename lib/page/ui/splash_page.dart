import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controller/splash_controller.dart';
import '../../resource/image.dart';
import '../widget/all_widget.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: gradientColor(),
        child: SlideTransition(
          position: controller.offsetAnimation,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Image.asset(logo,height: Get.height/4)),
            ),
          ),
        ),
      ),
    );
  }
}
