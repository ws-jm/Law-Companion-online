import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class CasesDetailController extends GetxController {
  RxString htmlToParse = ''.obs;

  late WebViewController controller;
  final Completer<WebViewController> webController = Completer<WebViewController>();
  var arg;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    arg = Get.arguments;
    makeRequest(arg);

  }

  void makeRequest(url) async {
    print(url);
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      htmlToParse.value = response.body;
    }
  }

  loadLocalHTML(url) async {
    String fileHtmlContents = await rootBundle.loadString(url);
    controller.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
