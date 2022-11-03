import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/rules/rules_1_controller.dart';
import '../../../resource/all_color.dart';
import '../../../route/route.dart';
import '../../widget/all_widget.dart';

class ChapterRulesPage extends GetView<Rules1Controller> {
  const ChapterRulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _navigateAndDisplaySelection(index) async {
      controller.result = await Get.toNamed(AppRoute.chapterDetails,arguments:[ controller.result[1],controller.result[2],index,0,true]);
      print(controller.result[0]);
      print(controller.result[1]);
    }
    return Scaffold(
        body: Container(
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
              Obx(() =>  controller.result.isEmpty ? const SizedBox() :
        controller.searchResultChapter.length != 0
                  ? Expanded(
                child: ListView.builder(
                    itemCount: controller.searchResultChapter.length,
                    itemBuilder: (BuildContext context,int index){
                      var int = index+1;
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          color: appBarColor,
                          child: InkWell(
                            onTap: (){
                              _navigateAndDisplaySelection(int);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:  RichText(
                                  text: TextSpan(
                                    children: highlightOccurrences(controller.searchResultChapter[index]['title'], controller.chapterController.text),
                                    style: TextStyle(color: Colors.white,fontSize: 15),
                                  ),
                                ),
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
                      return  Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          color: appBarColor,
                          child: InkWell(
                            onTap: (){
                              _navigateAndDisplaySelection(controller.result[0][index]['id']);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: normalText(controller.result[0][index]['title'],
                                  15, Colors.white),
                            ),
                          ),
                        ),
                      );
                    }),
              )),
            ],
          ),
        ));
  }
}
