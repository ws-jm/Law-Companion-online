import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ftv2/page/ui/laws/chapter_page.dart';
import 'package:ftv2/page/ui/laws/section_page.dart';
import 'package:get/get.dart';
import '../../page/ui/laws/laws_1_page.dart';
import '../../shared/common/state_status.dart';

class LawsController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  TextEditingController controller =  TextEditingController();

  RxInt selectedIndex = 0.obs;

  final _stateStatusRx = Rx<StateStatus>(StateStatus.INITIAL);
  StateStatus get stateStatus => _stateStatusRx.value;

  final List<Tab> myTabs = <Tab>[
     const Tab(text: 'LAWS'),
     const Tab(text: 'CHAPTER'),
    const Tab(text: 'SECTION'),
  ];
  List<Widget> pageList = [
    const Laws1Page(),
    const ChapterPage(),
    const SectionPage(),
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