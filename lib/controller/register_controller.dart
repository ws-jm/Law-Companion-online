import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:ftv2/page/widget/extensions.dart';
import 'package:ftv2/resource/extensions.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
import '../model/register_entity.dart';
import '../resource/server_string.dart';
import '../route/route.dart';
import '../shared/api_repository.dart';
import '../shared/get_storage_repository.dart';

class RegisterController extends GetxController {
  final ApiRepository _apiRepository;
  final GetStorageRepository _getStorageRepository;

  RegisterController(this._apiRepository, this._getStorageRepository);

  final validationKey = GlobalKey<FormState>();


  final TextEditingController email = TextEditingController();
  final TextEditingController referId = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController organization = TextEditingController();

  final _autoValidateRx = Rx<bool>(false);
  RxString deviceId = ''.obs;
  // drop down box
  RxString selectedCountry = "Adamawa".obs;
  var countryListRx = Rx<List<String>>(["Adamawa",
    "Akwa Ibom",
    "Anambra",
    "Bauchi",
    "Bayelsa",
    "Benue",
    "Borno",
    "Cross River",
    "Delta",
    "Ebonyi",
    "Edo",
    "Ekiti",
    "Enugu",
    "FCT",
    "Gombe",
    "imo",
    "Jigawa",
    "Kaduna",
    "Kano",
    "Katsina",
    "Kebbi",
    "Kogi",
    "Kwara",
    "Lagos",
    "Nasaraw",
    "Niger",
    "Ogun",
    "Ondo",
    "Osun",
    "Oyo",
    "Plateau",
    "Rivers",
    "Sokoto",
    "Taraba",
    "Yobe",
    "Zamfara"]);

  onSelectedCountry(value) {
    selectedCountry.value = value;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
     deviceId.value = (await PlatformDeviceId.getDeviceId)!;
  }
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  registerApi() async {
    if (Platform.isIOS) {
      var deviceIosId =  _getId();
      deviceId.value = await deviceIosId!;
      print('iossss');
    } else {
      deviceId.value = (await PlatformDeviceId.getDeviceId)!;
    }    _apiRepository.postApi(ServerString.registerUrl,headers: headers, data: {
      'refer_id': referId.text,
      'email': email.text.trim(),
      'name': name.text,
      "phone" : phone.text,
      'device_id': deviceId.value,
      'state': selectedCountry.value,
      'organization':organization.text,
    }, success: (response) {
      hideProgressBar();
      RegisterEntity registerEntity = RegisterEntity.fromRawJson(response);
      if (registerEntity.status == 'success') {
        showSuccessSnackbar('Register Successful');
        Get.offNamed(AppRoute.login);
      }else{
        showErrorSnackbar(registerEntity.errorMsg);
      }
    }, error: (error) {
      hideProgressBar();
      showErrorSnackbar(error!.message);
    });
  }

  checkAutoValidate() {
    _autoValidateRx.value = true;
  }

  String? isEmailValid(String? value) => value!.trim().validateEmail();
  String? isNameValid(String? value) => value!.trim().validateName();
  String? isNumberValid(String? value) => value!.trim().validateMobile();

  _getId() async {
    return FlutterUdid.consistentUdid; // unique ID on iOS
  }

}
