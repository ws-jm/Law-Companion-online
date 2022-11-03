import 'package:flutter/material.dart';
import 'package:ftv2/controller/rules/rules_1_controller.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import '../../../resource/all_color.dart';
import '../../../route/route.dart';
import "package:collection/collection.dart";

class SectionRulesPage extends GetView<Rules1Controller> {
  const SectionRulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 var istrue = true.obs;
    Future<void> _navigateAndDisplaySelection(index) async {
      controller.result = await Get.toNamed(AppRoute.chapterDetails,arguments:[ controller.result[1],controller.result[2],index,0,true]);
      print(controller.result[0]);
      print('123456783 ${controller.result[1]}');
    }
 print(istrue);
    return Scaffold(
      body:  Container(
          decoration: gradientColor(),
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 4,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(controller.result[0].length, (index) {
            return InkWell(
              onTap: (){
                _navigateAndDisplaySelection(controller.result[0][index]['id']);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                              color: appBarColor,
                  child: Center(
                    child: controller.result[0][index]['title'].toString().contains('ORDER') ? Text(controller.result[0][index]['title'].toString().substring(0,7),style: TextStyle(color: Colors.white),):Text(controller.result[0][index]['id'].toString(),style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
      // Container(
      //   decoration: gradientColor(),
      //   child: GroupedListView<dynamic, String>(
      //     elements: controller.result[0],
      //     groupBy: (element) => element['section'],
      //     useStickyGroupSeparators: false,
      //     groupSeparatorBuilder: (String value) => Padding(
      //       padding: const EdgeInsets.only(left: 8.0),
      //       child: Text(
      //         value,
      //         textAlign: TextAlign.start,
      //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
      //       ),
      //     ),
      //     itemBuilder: (c, element) {
      //       print(element['section']);
      //       return Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(
      //           element['id'].toString(),
      //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
      //         ),
      //       );
      //     },
      //   ),
      // ),

      // Container(
      //   decoration: gradientColor(),
      //   child: controller.result.isEmpty ? Container( decoration: gradientColor()) : Expanded(
      //     child: GridView.builder(
      //       // staggeredTileBuilder: (int index) =>
      //       //     StaggeredTile.count((index % 9 == 0) ? 4 : 1, 1),
      //         itemCount: controller.result[0].length,
      //         itemBuilder: (BuildContext context,int indexs){
      //           var newMap = groupBy(controller.result[0], (Map obj) => obj[indexs]['section']);
      //
      //           print(newMap);
      //           print(istrue);
      //           controller.result[0][indexs]['title'].toString().contains('ORDER') == true ?istrue(false) :istrue(true);
      //           return Container(
      //             color: appBarColor,
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Column(
      //                 children: [
      //                   controller.result[0][indexs]['title'].toString().contains('ORDER') ? Text(controller.result[0][indexs]['title'].toString(),style: TextStyle(color: Colors.white),):Text(controller.result[0][indexs]['id'].toString()),
      //                   // controller.result[0][indexs]['id'].toString().contains('-')  ? Text(controller.result[0][indexs]['id'].toString()):SizedBox(),
      //                 ],
      //               ),
      //             ),
      //           );
      //         }, gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: istrue == true ? 4 : 1,
      //         crossAxisSpacing: 4,
      //         mainAxisSpacing: 10,
      //         // childAspectRatio: 3/3
      //     ),),
      //   ),
      // ),
    );
  }
}
