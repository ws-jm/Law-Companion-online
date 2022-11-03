import 'package:flutter/material.dart';
import 'package:ftv2/page/ui/rules/chapter_rules_page.dart';
import 'package:ftv2/page/ui/rules/rules_1_page.dart';
import 'package:ftv2/page/ui/rules/section_rules_page.dart';
import 'package:get/get.dart';


class RulesController extends GetxController with GetSingleTickerProviderStateMixin {

  late TabController tabController;
  TextEditingController controller =  TextEditingController();

  RxInt selectedIndex = 0.obs;

  final List<Tab> myTabs = <Tab>[
     const Tab(text: 'RULES'),
     const Tab(text: 'CHAPTER'),
    const Tab(text: 'SECTION'),
  ];
  List<Widget> pageList = [
    const Rules1Page(),
    const ChapterRulesPage(),
    const SectionRulesPage(),
  ];
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    tabController =  TabController(vsync: this, length: myTabs.length);
    tabController.addListener(() {
      selectedIndex.value = tabController.index;
      print("Selected Index: ${tabController.index}");
    });
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


}