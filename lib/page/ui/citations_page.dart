import 'package:flutter/material.dart';
import 'package:ftv2/controller/citations_controller.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:get/get.dart';

class CitationsPage extends GetView<CitationsController> {
  const CitationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText('Citations', 20, Colors.white),
        backgroundColor: appBarColor,
      ),
      body: Container(
        decoration: gradientColor(),
        child: ListView.builder(
            itemCount: controller.citationsList.length,
            itemBuilder: (BuildContext context,int index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,2),
                child: Container(
                  color: appBarColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: normalText(controller.citationsList[index], 15, Colors.white),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
