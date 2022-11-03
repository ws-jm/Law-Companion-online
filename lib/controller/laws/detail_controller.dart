import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:webview_flutter/webview_flutter.dart';
import 'laws_controller.dart';

class DetailController extends GetxController {

  late WebViewController controller;

  RxString htmlToParse = ''.obs;

   var arg = [].obs;
   List<String> data = [];
   final LawsController lawsController =
   Get.put(LawsController());

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    arg.value = await Get.arguments;
    makeRequest(arg[0]);
  }
  void makeRequest(url) async{
    print('url--${arg[1]}');
    print('url--${url}');
    var response = await http.get(Uri.parse('${url}#${arg[2]}'));
    if(response.statusCode == 200){
      htmlToParse.value = response.body;
      print('url${response.body}');
      parseData();
    }
  }
   parseData(){
     var document = parse(htmlToParse.value);
     document.getElementsByTagName("h4").map((e) => e.innerHtml).forEach((element) {
       if(element != "-"){
         data.add(element.replaceAll('<strong>', '').replaceAll('</strong>', ''));
       }
     });
   }
}