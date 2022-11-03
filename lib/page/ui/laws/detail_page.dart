import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:ftv2/controller/laws/detail_controller.dart';
import 'package:ftv2/page/widget/scrolling_text.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../widget/all_widget.dart';


class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Completer<WebViewController> _controller =
    Completer<WebViewController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        title: const Text('Details'),
      ),
        body: Platform.isIOS || Platform.isAndroid
            ? Obx(() =>Container(
          color: webBackgroundColor,
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      controller.lawsController.selectedIndex.value  = controller.arg[3];
                      print(controller.lawsController.selectedIndex.value);
                      Get.back(result: [controller.data,controller.arg[0],controller.arg[1]]);
                      controller.lawsController.tabController.animateTo(controller.lawsController.selectedIndex.value += 1);
                    },
                    child: Container(
                      width: Get.width/1.3,
                      height: 50,
                      decoration: BoxDecoration(
                        color: appBarColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ScrollingText(text: controller.arg[1], textStyle: const TextStyle(color: Colors.yellow,fontSize: 15)),
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: (){
                      controller.lawsController.selectedIndex.value  = controller.arg[3];
                      Get.back(result: [controller.data,controller.arg[0],controller.arg[1]]);
                      controller.lawsController.tabController.animateTo(controller.lawsController.selectedIndex.value += 2);
                    },
                    child: Container(
                      height: 50,
                      width:50,
                      decoration: BoxDecoration(
                        color: appBarColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            normalText(controller.arg[2].toString(), 13, Colors.white),
                            const SizedBox(width: 5),
                            const Icon(Icons.arrow_drop_down,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    Expanded(
          child: WebView(
            zoomEnabled: true,
            initialUrl: '${controller.arg[0]}#${controller.arg[2]}',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onProgress: (int progress) {
              print('WebView is loading (progress : "${controller.arg[0]}#${controller.arg[2]}"%)');
            },
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                print('blocking navigation to $request}');
                return NavigationDecision.prevent;
              }
              print('allowing navigation to $request');
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
            backgroundColor: webBackgroundColor,
          ),
      )
          ],
      ),
        ))
            : Obx(() => SingleChildScrollView(child: Container(
          decoration: gradientColor(),
        // color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      controller.lawsController.selectedIndex.value  = controller.arg[3];
                      print(controller.lawsController.selectedIndex.value);
                      Get.back(result: [controller.data,controller.arg[0],controller.arg[1]]);
                      controller.lawsController.tabController.animateTo(controller.lawsController.selectedIndex.value += 1);
                    },
                    child: Container(
                      width: Get.width/1.3,
                      height: 50,
                      decoration: BoxDecoration(
                        color: appBarColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ScrollingText(text: controller.arg[1], textStyle: const TextStyle(color: Colors.yellow,fontSize: 15)),
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: (){
                      controller.lawsController.selectedIndex.value  = controller.arg[3];
                      Get.back(result: [controller.data,controller.arg[0],controller.arg[1]]);
                      controller.lawsController.tabController.animateTo(controller.lawsController.selectedIndex.value += 2);
                    },
                    child: Container(
                      height: 50,
                      width:50,
                      decoration: BoxDecoration(
                        color: appBarColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            normalText(controller.arg[2].toString(), 13, Colors.white),
                            const SizedBox(width: 5),
                            const Icon(Icons.arrow_drop_down,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: HtmlWidget(controller.htmlToParse.value,textStyle: TextStyle(color: Colors.white),),
              ),
          ],
        ),
      )))
           );
  }
}
