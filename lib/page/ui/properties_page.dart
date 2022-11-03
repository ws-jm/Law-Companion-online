import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:ftv2/controller/properties_controller.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:ftv2/route/route.dart';
import 'package:ftv2/shared/common/state_status.dart';
import 'package:get/get.dart';

import '../../resource/image.dart';

class PropertiesPage extends GetView<PropertiesController> {
  const PropertiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText('Properties', 20, Colors.white),
        backgroundColor: appBarColor,
      ),
      body: Obx(()=>
      controller.stateStatus == StateStatus.LOADING ?  const Center(
        child: CircularProgressIndicator(
            strokeWidth: 1),
      )
          :
          Container(
        decoration: gradientColor(),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (BuildContext context,int index){
                    return  Card1(index);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: purpleButton('POST AN ADVERT',
                      (){Get.toNamed(AppRoute.uploadAdvert);}),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}

class Card1 extends GetView<PropertiesController> {
   final int index;
  const Card1(this.index,  {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            color: appBarColor,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 150,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.rectangle,
                    ),
                    child: ClipRRect(
                      child: Image.network(
                        controller.data[index].imageUrl!,
                        height: Get.width / 3,
                        width: Get.width,
                        fit: BoxFit.fill,
                      ),
                    )
                  ),
                ),
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header:  Padding(
                        padding: const EdgeInsets.all(10),
                        child: normalText(
                          controller.data[index].price!,  15, Colors.white
                        )),
                    expanded:  normalText(controller.data[index].description!,
                        15, Colors.white),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    }, collapsed: const Text(''),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
