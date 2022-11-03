import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/onboarding_entity.dart';
import '../resource/image.dart';
import '../resource/session_string.dart';
import '../route/route.dart';
import '../shared/get_storage_repository.dart';

class OnBoardingController extends GetxController {
  final GetStorageRepository _getStorageRepository;
  RxInt selectPageIndex = 0.obs;
  
  
  OnBoardingController(this._getStorageRepository);
  var pageController = PageController();
  
  forwardAction() {
    _getStorageRepository.write(SessionString.onBoarding, true);
    Get.offNamed(AppRoute.login);
  }

  List<OnBoardingEntity> onBoardingPages = [
    OnBoardingEntity(firstPage,'Create an account','Connect with people around the world','User will be able to give you live, chat and meet with people nearby.'),
    OnBoardingEntity(secondPage,'Login to your account','Let\'s build connection with new people','Connect helps you locate the people around you who are closest from your home.'),
    OnBoardingEntity(thirdPage,'Login to your account','Feel the happiness','User will be able to give you live, chat and meet with people nearby.'),
  ];

}