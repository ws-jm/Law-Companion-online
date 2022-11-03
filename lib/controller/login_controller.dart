import 'dart:io';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:ftv2/model/login_entity.dart';
import 'package:ftv2/resource/extensions.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
import '../resource/server_string.dart';
import '../resource/session_string.dart';
import '../route/route.dart';
import '../shared/api_repository.dart';
import '../shared/get_storage_repository.dart';
import 'package:intl/intl.dart';

class LoginController extends GetxController {
  final ApiRepository _apiRepository;
  final GetStorageRepository _getStorageRepository;

  LoginController(this._apiRepository, this._getStorageRepository);

  RxString deviceId = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  loginApi() async {
    _getStorageRepository.remove(SessionString.referIdSession);
    _getStorageRepository.remove(SessionString.emailSession);
    _getStorageRepository.remove(SessionString.nameSession);
    _getStorageRepository.remove(SessionString.pointSession);
    _getStorageRepository.remove(SessionString.deviceIdSession);
    if (Platform.isIOS) {
      var deviceIosId = await _getId();
      deviceId.value =  deviceIosId!;
      print('iossss');
    } else {
      //1034.38
      deviceId.value = (await PlatformDeviceId.getDeviceId)!;
    }
    _apiRepository.postApi(ServerString.loginUrl, headers: headers, data: {
      'device_id': deviceId.value,
    }, success: (response) async {
      hideProgressBar();
      LoginEntity loginEntity = LoginEntity.fromRawJson(response);
      if (loginEntity.status == 'success') {
        _getStorageRepository.write(
            SessionString.referIdSession, loginEntity.referid);
        _getStorageRepository.write(
            SessionString.emailSession, loginEntity.email);
        _getStorageRepository.write(
            SessionString.nameSession, loginEntity.userName);
        _getStorageRepository.write(
            SessionString.pointSession, loginEntity.point);
        _getStorageRepository.write(
            SessionString.deviceIdSession, deviceId.value);
        DateTime dateTimeNow = DateTime.now();
        DateTime   formattedDate =DateTime.parse(DateFormat('yyyy-MM-dd').format(loginEntity.endOn!));
        final days = await daysBetween(dateTimeNow, formattedDate);

        if(days > 0){
        Get.offNamed(AppRoute.home,arguments: days);
        }else {
          Get.offNamed(AppRoute.paymentPage,arguments: days);
        }
      } else {
        showErrorSnackbar(loginEntity.errorMsg);
      }
    }, error: (error) {
      hideProgressBar();
      showErrorSnackbar(error!.message);
    });
  }
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
  _getId() async {
    return FlutterUdid.consistentUdid; // unique ID on iOS
  }
}
