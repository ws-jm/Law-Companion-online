import 'package:flutter/material.dart';
import 'package:ftv2/model/home_entity.dart';
import 'package:ftv2/resource/extensions.dart';
import 'package:ftv2/resource/hex_colors.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../resource/server_string.dart';
import '../resource/session_string.dart';
import '../shared/api_repository.dart';
import '../shared/common/state_status.dart';
import '../shared/get_storage_repository.dart';

class HomeController extends GetxController {
  final ApiRepository _apiRepository;
  final GetStorageRepository _getStorageRepository;

  HomeController(this._apiRepository, this._getStorageRepository);
  final _stateStatusRx = Rx<StateStatus>(StateStatus.INITIAL);
  StateStatus get stateStatus => _stateStatusRx.value;
  TextEditingController controller =  TextEditingController();

  var name = ''.obs;
  var deviceId = ''.obs;
  var email = ''.obs;
  var point = ''.obs;
  var referId = ''.obs;
  final _dataRx = Rx<HomeEntity>(HomeEntity());
  HomeEntity get data => _dataRx.value;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
    deviceId.value =   _getStorageRepository.read(SessionString.deviceIdSession);
    referId.value =   _getStorageRepository.read(SessionString.referIdSession);
    email.value =  _getStorageRepository.read(SessionString.emailSession);
    name.value =  _getStorageRepository.read(SessionString.nameSession);
    point.value = _getStorageRepository.read(SessionString.pointSession);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  };
    getData() async {
      _stateStatusRx.value = StateStatus.LOADING;
      _apiRepository.postApi(ServerString.homeUrl,headers: headers,
          success: (response) {
        HomeEntity homeEntity = HomeEntity.fromRawJson(response);
        if (homeEntity.status == 'success') {
          _dataRx.value =HomeEntity.fromRawJson(response);
          _stateStatusRx.value = StateStatus.SUCCESS;
        }
      }, error: (error) {
            _stateStatusRx.value = StateStatus.SUCCESS;
            showErrorSnackbar(error!.message);
      });
    }

  pointAddApi(url) async {
    showProgress();
      _apiRepository.postApi(ServerString.poinAddUrl,headers: headers, data: {
      'device_id': deviceId.value,
        'type': 0,
    }, success: (response) {
        hideProgressBar();
        launchUrl(url);
    }, error: (error) {
      hideProgressBar();
      showErrorSnackbar(error!.message);
    });
  }

  searchHistoryAdd(value) async {
    _apiRepository.postApi(ServerString.SearchHistoryAddUrl,headers: headers, data: {
      'device_id': deviceId.value,
      'search_text': value,
    }, success: (response) {
    }, error: (error) {
      showErrorSnackbar(error!.message);
    });
  }

  box(day){
    Get.defaultDialog(
      backgroundColor: HexColor('616161'),
        title: 'Subscription',
        titleStyle: TextStyle(color: Colors.white),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$day Days Remaining',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ],
            )
          ],
        ),
        radius: 10.0);
  }

}