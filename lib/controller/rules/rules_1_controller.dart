import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ftv2/model/rules_entity.dart';
import 'package:ftv2/resource/extensions.dart';
import 'package:get/get.dart';
import '../../resource/server_string.dart';
import '../../resource/session_string.dart';
import '../../shared/api_repository.dart';
import '../../shared/common/state_status.dart';
import '../../shared/get_storage_repository.dart';
class Rules1Controller extends GetxController {

  final ApiRepository _apiRepository;
  final GetStorageRepository _getStorageRepository;

  Rules1Controller(this._apiRepository, this._getStorageRepository);
  TextEditingController controller =  TextEditingController();
  TextEditingController chapterController =  TextEditingController();

  RxList<Rule> searchResultLaws = <Rule>[].obs;

  RxList<dynamic> searchResultChapter = <dynamic>[].obs;

  List result = [].obs;

  var deviceId = ''.obs;

  final _dataRx = Rx<List<Rule>>([]);
  List<Rule> get data => _dataRx.value;
  var dat;
  late List<Rule> datas;

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
    List<dynamic> results = [];
    print(results);
    if (text.isEmpty) {
      results =  result[0];
    } else {
      print(results);
      results =  result[0]
          .where((element) => element
          .toString()
          .toLowerCase()
          .contains(text.toLowerCase()))
          .toList() as List<dynamic>;
    }
    print(results);
    searchResultChapter.value = results;
    print(  searchResultChapter);
  }
  void searchLaws(String text) {
    List<Rule> results = [];
    if (text.isEmpty) {
      results = data;
    } else {
      results = data
          .where((element) => element.rules
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
    _apiRepository.postApi(ServerString.rulesUrl,headers: headers,
        success: (response) {
          RulesEntity lawsEntity = RulesEntity.fromRawJson(response);
          if (lawsEntity.status == 'success') {
            _dataRx.value =RulesEntity.fromRawJson(response).rules!;
            _dataRx.value.sort((a,b) {
              var adate = a.rules!.trim();//before -> var adate = a.expiry;
              var bdate = b.rules!.trim(); //before -> var bdate = b.expiry;
              return adate.compareTo(bdate); //to get the order other way just switch `adate & bdate`
            });
            var jsonData = jsonEncode(_dataRx.value);
            _getStorageRepository.write(SessionString.ruleData,jsonData);
            dat =   _getStorageRepository.read(SessionString.ruleData);
            Iterable l = json.decode(dat);
            datas = List<Rule>.from(l.map((model)=> Rule.fromJson(model)));
            _stateStatusRx.value = StateStatus.SUCCESS;
          }
        }, error: (error) {
          dat =   _getStorageRepository.read(SessionString.ruleData);
          Iterable l = json.decode(dat);
          datas = List<Rule>.from(l.map((model)=> Rule.fromJson(model)));
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