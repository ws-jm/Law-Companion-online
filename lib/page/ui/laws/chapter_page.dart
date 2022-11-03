import 'package:flutter/material.dart';
import 'package:ftv2/controller/laws/laws_1_controller.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:get/get.dart';
import '../../../route/route.dart';

class ChapterPage extends GetView<Laws1Controller> {
  const ChapterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _navigateAndDisplaySelection(index) async {
      controller.result = await Get.toNamed(AppRoute.details,arguments:[ controller.result[1],controller.result[2],index,0,true]);
      print(controller.result[0]);
      print(controller.result[1]);
    }
    return Scaffold(
      body: Obx(() => Container(
        decoration: gradientColor(),
        child: Column(
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
                    onSubmitted: (value){
                      controller.searchHistoryAdd(value);
                    },
                    onChanged: (value) => controller.searchChapter(value),
                    style: const TextStyle(color: Colors.white),
                    controller: controller.chapterController,
                    decoration: const InputDecoration(
                        hintText: 'Search', border: InputBorder.none,hintStyle: TextStyle(color: Colors.grey)),
                    // onChanged: onSearchTextChanged,
                  ),
                ),
              ),
            ),
            controller.result.isEmpty ? const SizedBox() :
            controller.searchResultChapter.length != 0
                ? Expanded(
              child: ListView.builder(
                  itemCount: controller.searchResultChapter.length,
                  itemBuilder: (BuildContext context,int index){
                    var int = index+1;
                    return InkWell(
                      onTap: (){
                        _navigateAndDisplaySelection(int);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  RichText(
                            text: TextSpan(
                              children: highlightOccurrences(controller.searchResultChapter[index], controller.chapterController.text),
                              style: TextStyle(color: Colors.white,fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ):
            Expanded(
              child: ListView.builder(
                  itemCount: controller.result[0].length,
                  itemBuilder: (BuildContext context,int index){
                    var int = index+1;
                    return InkWell(
                      onTap: (){
                        _navigateAndDisplaySelection(int);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: normalText(controller.result[0][index].replaceAll('<p>', '').replaceAll('</p>', ''),
                              15, Colors.white),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
