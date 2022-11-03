import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:ftv2/page/widget/extensions.dart';
import 'package:ftv2/resource/extensions.dart';
import 'package:ftv2/shared/api_repository.dart';
import 'package:ftv2/shared/get_storage_repository.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
import '../resource/server_string.dart';
import 'package:http/http.dart'as http;

class UploadAdvertController extends GetxController {

  final ApiRepository _apiRepository;
  final GetStorageRepository _getStorageRepository;

  UploadAdvertController(this._apiRepository, this._getStorageRepository);

  final validationKey = GlobalKey<FormState>();


  final TextEditingController desc = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();

  //image

  final _autoValidateRx = Rx<bool>(false);
  RxString deviceId = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    deviceId.value = (await PlatformDeviceId.getDeviceId)!;
  }
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  checkAutoValidate() {
    _autoValidateRx.value = true;
  }

  String? isEmailValid(String? value) => value!.trim().validateEmail();
  String? isNameValid(String? value) => value!.trim().validateName();
  String? isNumberValid(String? value) => value!.trim().validateMobile();

  _getId() async {
    return FlutterUdid.consistentUdid; // unique ID on iOS
  }

  RxString? fileName = ''.obs;
  FilePickerResult? result;
  PlatformFile? pickedfile;
  File? fileToDisplay;


  void pickFiles() async {
    print('asdfghj');
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      if(result!= null){
        fileName?.value = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());
        update();
      }
    } on PlatformException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  uploadImage() async{


    var request = http.MultipartRequest("POST",Uri.parse(ServerString.addPropertyUrl));

    request.fields['description'] = desc.text;
    request.fields['location'] = location.text;
    request.fields['price'] = price.text;
    request.fields['fullName'] = fullName.text;
    request.fields['email'] = email.text;
    // request.headers['Authorization'] = "Client-ID " +"f7........";
    var picture = http.MultipartFile.fromBytes('image', (await rootBundle.load(pickedfile!.path.toString())).buffer.asUint8List(),
        filename: 'testimage.png');

    request.files.add(picture);
    // request.headers[headers];
    print(request);
    var response = await request.send();
    print(response.statusCode);
    if(response.statusCode == '200'){
      showSuccessSnackbar('Advert Add  Successful');
      Get.back();
    }
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);
    print(result);

  }
}