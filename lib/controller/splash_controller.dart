import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../resource/session_string.dart';
import '../route/route.dart';
import '../shared/get_storage_repository.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final GetStorageRepository _getStorageRepository;
  SplashController(this._getStorageRepository);
  late AnimationController _controller;
  late Animation<Offset> offsetAnimation;

  @override
  void onInit() {
    super.onInit();
    _controller =
        AnimationController(duration: const Duration(seconds: 0), vsync: this);
    offsetAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 0.0)).animate(
            CurvedAnimation(parent: _controller, curve: Curves.decelerate));
  }

  @override
  void onReady() {
    super.onReady();
    _launchPage();
  }

  _launchPage() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    bool isLogin =
    _getStorageRepository.hasData(SessionString.isLoginSession);
    bool isOnBoarding =
    _getStorageRepository.hasData(SessionString.onBoarding);
    if (isLogin == false && isOnBoarding == true) {
      Get.offNamed(AppRoute.login);
    }else if (isLogin == true && isOnBoarding == true) {
      Get.offNamed(AppRoute.home);
    }else{
      Get.offNamed(AppRoute.onBoarding);
    }
  }
}
