import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controller/cases_detail_controller.dart';

class CasesDetailPage extends GetView<CasesDetailController> {
  const CasesDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          elevation: 0,
          title: const Text('Details'),
        ),
        body:Platform.isIOS || Platform.isAndroid
                ? Container(
                    color: webBackgroundColor,
                    child: WebView(
                      initialUrl: controller.arg,
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (WebViewController webViewController) {
                        controller.webController.complete(webViewController);
                      },
                      gestureNavigationEnabled: true,
                      backgroundColor: webBackgroundColor,
                    ))
                : Obx(() => SingleChildScrollView(
                    child: Container(
                        decoration: gradientColor(),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: HtmlWidget(controller.htmlToParse.value,textStyle: TextStyle(color: Colors.white)),
                        ))))
         );
  }
}
