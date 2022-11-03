import 'package:flutter/material.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:ftv2/route/route.dart';
import 'package:get/get.dart';
import '../../../controller/laws/laws_1_controller.dart';
import '../../../shared/common/state_status.dart';

class Laws1Page extends GetView<Laws1Controller> {
  const Laws1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: gradientColor(),
        child:Obx(() =>  controller.stateStatus == StateStatus.LOADING ?  const Center(
        child: CircularProgressIndicator(
        strokeWidth: 1),
        )
            :   Obx(() => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(10.0)),
                ),
                child:  ListTile(
                  leading:   const Icon(Icons.search,color: Colors.white),
                  title:  TextField(
                    controller: controller.controller,
                    onSubmitted: (value){
                      print(value);
                      controller.searchHistoryAdd(value);
                    },
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) => controller.searchLaws(value),
                    decoration: const InputDecoration(
                        hintText: 'Search', border: InputBorder.none,hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
            ),
            controller.searchResultLaws.length != 0 || controller.controller.text.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                  itemCount:  controller.searchResultLaws.length,
                  itemBuilder: (BuildContext context,int index){
                    return InkWell(
                      onTap: () async {
                        controller.result = await Get.toNamed(AppRoute.details,arguments:[ controller.searchResultLaws[index].url!,controller.searchResultLaws[index].laws!,1,0,true]);
                        print(controller.result[0]);
                        print(controller.result[1]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: appBarColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  RichText(
                              text: TextSpan(
                                children: highlightOccurrences(controller.searchResultLaws[index].laws!, controller.controller.text),
                                style: TextStyle(color: Colors.white,fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ) :   Expanded(
              child: ListView.builder(
                  itemCount:  controller.data.length,
                  itemBuilder: (BuildContext context,int index){
                    return InkWell(
                      onTap: () async {
                        controller.result = await Get.toNamed(AppRoute.details,arguments:[controller.data[index].url!,controller.data[index].laws!,1,0,true]);
                        print(controller.result[0]);
                        print(controller.result[1]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: appBarColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: normalText(controller.data[index].laws!,
                                15, Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    )));
  }
}
