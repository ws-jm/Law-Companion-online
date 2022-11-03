import 'package:flutter/material.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:get/get.dart';


class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var arg = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: boldText('News Detail', 20, Colors.white),
        backgroundColor: appBarColor,
      ),
        body: Container(
          height: Get.height,
              decoration: gradientColor(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: normalText(arg, 20, Colors.white),
              ),
            ),
    );
  }
}
