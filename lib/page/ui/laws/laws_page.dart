import 'package:flutter/material.dart';
import 'package:ftv2/controller/laws/laws_controller.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:get/get.dart';

class LawsPage extends GetView<LawsController> {
  const LawsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText('Laws', 20, Colors.white),
        backgroundColor: appBarColor,
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
          ],
        ),
      ),
    );
  }
}
