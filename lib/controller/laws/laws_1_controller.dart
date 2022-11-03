import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ftv2/model/laws_entity.dart';
import 'package:ftv2/resource/extensions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../resource/server_string.dart';
import '../../resource/session_string.dart';
import '../../shared/api_repository.dart';
import '../../shared/common/state_status.dart';
import '../../shared/get_storage_repository.dart';

class Laws1Controller extends GetxController {
  final ApiRepository _apiRepository;
  final GetStorageRepository _getStorageRepository;

  Laws1Controller(this._apiRepository, this._getStorageRepository);
  TextEditingController controller =  TextEditingController();
  TextEditingController chapterController =  TextEditingController();

  RxList<Law> searchResultLaws = <Law>[].obs;

  RxList<String> searchResultChapter = <String>[].obs;

  List result = [].obs;
  var getJsonData;

  var deviceId = ''.obs;
  final box = GetStorage();
  final _dataRx = Rx<List<Law>>([]);
  List<Law> get data => _dataRx.value;
  final _stateStatusRx = Rx<StateStatus>(StateStatus.INITIAL);
  StateStatus get stateStatus => _stateStatusRx.value;


  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    chapterController.clear();
    deviceId.value =   _getStorageRepository.read(SessionString.deviceIdSession);
    searchResultLaws.value = data;
    await   getData();
  }

  void searchChapter(String text) {
    List<String> results = [];
    if (text.isEmpty) {
      results =  result[0];
    } else {
      results =  result[0]
          .where((element) => element
          .toString()
          .toLowerCase()
          .contains(text.toLowerCase()))
          .toList();
    }
    searchResultChapter.value = results;
  }

  void searchLaws(String text) {
    List<Law> results = [];
    if (text.isEmpty) {
      results = data;
    } else {
      results = data
          .where((element) => element.laws
          .toString()
          .toLowerCase()
          .contains(text.toLowerCase()))
          .toList();
    }
    searchResultLaws.value = results;
  }

  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  getData() async {
    _stateStatusRx.value = StateStatus.LOADING;
    _apiRepository.postApi(ServerString.lawsUrl,headers: headers,
        success: (response) {
          LawsEntity lawsEntity = LawsEntity.fromRawJson(response);
          if (lawsEntity.status == 'success') {
            _dataRx.value =LawsEntity.fromRawJson(response).laws!;
            _dataRx.value.sort((a,b) {
              var adate = a.laws!.trim();//before -> var adate = a.expiry;
              var bdate = b.laws!.trim(); //before -> var bdate = b.expiry;
              return adate.compareTo(bdate); //to get the order other way just switch `adate & bdate`
            });
            _stateStatusRx.value = StateStatus.SUCCESS;
          }
        }, error: (error) {
          _stateStatusRx.value = StateStatus.SUCCESS;
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

}