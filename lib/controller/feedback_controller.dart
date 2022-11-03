import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ftv2/page/widget/extensions.dart';
import 'package:ftv2/resource/extensions.dart';
import '../model/register_entity.dart';
import '../resource/server_string.dart';
import '../resource/session_string.dart';
import '../shared/api_repository.dart';
import '../shared/get_storage_repository.dart';

class FeedBackController extends GetxController {

  final ApiRepository _apiRepository;
  final GetStorageRepository _getStorageRepository;

  FeedBackController(this._apiRepository, this._getStorageRepository);

  final validationKey = GlobalKey<FormState>();


  final TextEditingController email = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController organization = TextEditingController();

  final _autoValidateRx = Rx<bool>(false);
  RxString deviceId = ''.obs;


  @override
  Future<void> onInit() async {
    super.onInit();
    deviceId.value = _getStorageRepository.read(SessionString.deviceIdSession);
  }
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  feedBackApi() async {
    showProgress();
      _apiRepository.postApi(ServerString.feedbackUrl,headers: headers, data: {
      'title': title.text,
      'email': email.text.trim(),
      'description': description.text,
      'device_id': deviceId.value,
    }, success: (response) {
      hideProgressBar();
      RegisterEntity registerEntity = RegisterEntity.fromRawJson(response);
      if (registerEntity.status == 'success') {
        showSuccessSnackbar('Feedback Add Successful');
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

}
