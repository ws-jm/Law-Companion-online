import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ftv2/model/cases_entity.dart';
import 'package:ftv2/resource/extensions.dart';
import 'package:get/get.dart';
import '../resource/server_string.dart';
import '../resource/session_string.dart';
import '../shared/api_repository.dart';
import '../shared/common/state_status.dart';
import '../shared/get_storage_repository.dart';

class CasesController extends GetxController {

  final ApiRepository _apiRepository;
  final GetStorageRepository _getStorageRepository;

  CasesController(this._apiRepository, this._getStorageRepository);
  RxList<dynamic> searchCasesStatic = <dynamic>[].obs;

  final _stateStatusRx = Rx<StateStatus>(StateStatus.INITIAL);
  StateStatus get stateStatus => _stateStatusRx.value;
  TextEditingController controller = TextEditingController();
  var arg;
  var deviceId = ''.obs;
  final _dataRx = Rx<List<Hit>>([]);
  List<Hit> get data => _dataRx.value;

  @override
  void onInit()  {
    // TODO: implement onInit
    super.onInit();


    controller.text =  Get.arguments;
    deviceId.value =   _getStorageRepository.read(SessionString.deviceIdSession);
    arg = Get.arguments;
    getData();

  }


  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  var headersCases = {
    'X-TYPESENSE-API-KEY':'9FKQDdAIYN8UQReEGM0gZdAAUQtvq3Cx',
  };

  getData() async {
    _stateStatusRx.value = StateStatus.LOADING;
    _apiRepository.getApi(ServerString.casesUrl, headers: headersCases,queryParameters: {
      'sort_by' :'date:desc',
      'query_by' :'title',
      'per_page' : '250',
      'q': controller.text,
    },
        success: (response) {
          _dataRx.value =CasesEntity.fromJson(response).hits!;
          _stateStatusRx.value = StateStatus.SUCCESS;
        }, error: (error) {
          _stateStatusRx.value = StateStatus.SUCCESS;
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

}