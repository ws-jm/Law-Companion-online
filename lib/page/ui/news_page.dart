import 'package:flutter/material.dart';
import 'package:ftv2/controller/news_controller.dart';
import 'package:ftv2/page/ui/news_detail_page.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:get/get.dart';

import '../../shared/common/state_status.dart';

class NewsPage extends GetView<NewsController> {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText('News', 20, Colors.white),
        backgroundColor: appBarColor,
      ),
      body:
        Container(
        decoration: gradientColor(),
        child:Obx ( () =>controller.stateStatus == StateStatus.LOADING ?  const Center(
          child: CircularProgressIndicator(
              strokeWidth: 1),
        )
            : ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (BuildContext context,int index){
              return Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: (){
                    Get.to(NewsDetailPage(),arguments: controller.data[index].content!);
                  },
                  child: Container(
                    color: appBarColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: normalText(controller.data[index].title!, 15, Colors.white),
                    ),
                  ),
                ),
              );
            }),
      ),
      ));
  }
}
