import 'package:flutter/material.dart';
import 'package:ftv2/controller/cases_controller.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:ftv2/route/route.dart';
import 'package:get/get.dart';

import '../../shared/common/state_status.dart';

class CasesPage extends GetView<CasesController> {
  const CasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText('Cases', 20, Colors.white),
        backgroundColor: appBarColor,
      ),
      body: Container(
        decoration: gradientColor(),
        child:  Column(
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
                      leading:   Icon(Icons.search,color: Colors.white),
                      title:  TextField(
                        style: TextStyle(color: Colors.white),
                        controller: controller.controller,
                        onChanged: (value){
                          controller.getData();
                        },
                        onSubmitted: (value){
                          controller.searchHistoryAdd(value);
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: (){
                                controller.controller.clear();
                                controller.getData();
                              },
                              icon: Icon(Icons.clear,color: Colors.white,),
                            ),
                            hintText: 'Search', border: InputBorder.none,hintStyle: TextStyle(color: Colors.grey)),
                        // onChanged: onSearchTextChanged,
                      ),
                    ),
                  ),
                ),
        Obx(() => controller.stateStatus == StateStatus.LOADING ?  const Center(
          child: CircularProgressIndicator(strokeWidth: 1),
        )
            :   Expanded(
          child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (BuildContext context,int index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed(AppRoute.casesDetails,arguments: 'http://lawcompanion.net/api/elcDBsearch2.php?page=${controller.data[index].document!.pageStart}&task=${controller.data[index].document!.filename}');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: appBarColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            RichText(
                              text: TextSpan(
                                children: highlightOccurrences(controller.data[index].document!.title!, controller.controller.text),
                                style: TextStyle(color: Colors.white,fontSize: 15),
                              ),
                            )
                          ),
                        ),
                      ),
                    );
                  }),
        )),
              ],
            )
    ));
  }
}
