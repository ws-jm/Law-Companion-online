import 'package:flutter/material.dart';
import 'package:ftv2/model/news_entity.dart';
import 'package:ftv2/model/properties_entity.dart';
import 'package:ftv2/resource/extensions.dart';
import 'package:get/get.dart';
import '../../resource/server_string.dart';
import '../../resource/session_string.dart';
import '../../shared/api_repository.dart';
import '../../shared/common/state_status.dart';
import '../../shared/get_storage_repository.dart';

class PropertiesController extends GetxController {
  final ApiRepository _apiRepository;
  final GetStorageRepository _getStorageRepository;

  PropertiesController(this._apiRepository, this._getStorageRepository);
  TextEditingController controller =  TextEditingController();
  TextEditingController chapterController =  TextEditingController();



  //List result = [].obs;

  var deviceId = ''.obs;

  final _dataRx = Rx<List<Property>>([]);
  List<Property> get data => _dataRx.value;
  final _stateStatusRx = Rx<StateStatus>(StateStatus.INITIAL);
  StateStatus get stateStatus => _stateStatusRx.value;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    chapterController.clear();
    deviceId.value =   _getStorageRepository.read(SessionString.deviceIdSession);
    await   getData();
  }



  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  getData() async {
    _stateStatusRx.value = StateStatus.LOADING;
    _apiRepository.postApi(ServerString.propertiesUrl,headers: headers,
        success: (response) {
          PropertiesEntity propertiesEntity = PropertiesEntity.fromRawJson(response);
          if (propertiesEntity.status == 'success') {
            _dataRx.value =PropertiesEntity.fromRawJson(response).properties!;
            _stateStatusRx.value = StateStatus.SUCCESS;
          }
        }, error: (error) {
          _stateStatusRx.value = StateStatus.SUCCESS;
          showErrorSnackbar(error!.message);
        });
  }



}


