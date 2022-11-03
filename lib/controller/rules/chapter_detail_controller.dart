import 'dart:async';
import 'package:flutter/services.dart';
import 'package:ftv2/controller/rules/rules_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:webview_flutter/webview_flutter.dart';

class ChapterDetailController extends GetxController {

  late WebViewController controller;
  RxString htmlToParse = ''.obs;

  var arg = [].obs;
  List data = [];

  var connectionStatus = 2.obs;

   final RulesController rulesController =
   Get.put(RulesController());
   @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    arg.value = await Get.arguments;
    makeRequest(arg[0]);
  }
  void makeRequest(url) async{
     print('${url}#${arg[2]}');
    var response = await http.get(Uri.parse('${url}#${arg[2]}'));
    if(response.statusCode == 200){
      htmlToParse.value = response.body;
      print(response.body);
      parseData();
    }
  }

   parseData() async {
     Map<String, List> _elements = {};
     print('-- ${ htmlToParse.value}');

     var document = parse(htmlToParse.value);
     print(document);

     var chapters = document.getElementsByTagName("h4");
     print(chapters);
       int i=1;
       chapters.forEach((element) {
         data.add({'title':element.innerHtml,'id':i,'section':element.innerHtml});
         document.getElementsByTagName("a").forEach((elements) {
           if(elements.className == i.toString())
           {
             String ids= elements.id.toString();
             String titles= elements.innerHtml.toString();
             data.add({'title':titles,'id':ids,'section':element.innerHtml});
           }
         });
         i++ ;
       });
print(_elements);
   }

}