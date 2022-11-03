import 'package:flutter/material.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:get/get.dart';
import '../../../controller/rules/rules_controller.dart';

class RulesPage extends GetView<RulesController> {
  const RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText('Rules', 20, Colors.white),
        backgroundColor:  appBarColor,
      ),
      body: Container(
        decoration: gradientColor(),
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: TabBar(
                labelColor: yellowColor,
                indicatorColor: yellowColor,
                unselectedLabelColor: Colors.grey,
                controller: controller.tabController,
                tabs: controller.myTabs,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: controller.pageList,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         border: Border.all(color: Colors.white),
            //       borderRadius: const BorderRadius.all(
            //           Radius.circular(10.0)),
            //     ),
            //     child: const ListTile(
            //       leading:   Icon(Icons.search,color: Colors.white),
            //       title:  TextField(
            //         style: TextStyle(color: Colors.white),
            //         // controller: controller,
            //         decoration: InputDecoration(
            //             hintText: 'Search', border: InputBorder.none,hintStyle: TextStyle(color: Colors.grey)),
            //         // onChanged: onSearchTextChanged,
            //       ),
            //     ),
            //   ),
            // ),
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: 5,
            //       itemBuilder: (BuildContext context,int index){
            //         return Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Container(
            //             color: blueGrey,
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: normalText('descripation descripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripation',
            //                   15, Colors.white),
            //             ),
            //           ),
            //         );
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}
