import 'package:flutter/material.dart';
import 'package:ftv2/controller/search%20History_controller.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../shared/common/state_status.dart';

class SearchHistoryPage extends GetView<SearchHistoryController> {
  const SearchHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText('Search History', 20, Colors.white),
        backgroundColor:  appBarColor,
      ),
      body: Container(
        decoration: gradientColor(),
        child: Obx ( () =>controller.stateStatus == StateStatus.LOADING ?  const Center(
    child: CircularProgressIndicator(
    strokeWidth: 1),
    )
        :  ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (BuildContext context,int index){
              var dateFormat = DateFormat("dd-MM-yyyy").format(DateTime.parse(controller.data[index].date!.toString()));
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  color: appBarColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        normalText(dateFormat.toString(), 15, Colors.white),
                        SizedBox(width: 10),
                        normalText(controller.data[index].searchText!, 15, Colors.white),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
