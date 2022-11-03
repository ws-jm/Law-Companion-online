import 'package:flutter/material.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:get/get.dart';

import '../../../controller/laws/laws_1_controller.dart';
import '../../../resource/all_color.dart';
import '../../../route/route.dart';

class SectionPage extends GetView<Laws1Controller> {
  const SectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future<void> _navigateAndDisplaySelection(index) async {
      controller.result = await Get.toNamed(AppRoute.details,arguments:[ controller.result[1],controller.result[2],index,0,true]);
      print(controller.result[0]);
      print('123456783 ${controller.result[1]}');
    }
    return Scaffold(
      body:  Container(
        decoration: gradientColor(),
        child: controller.result.isEmpty ? Container( decoration: gradientColor()) : GridView.builder(
            itemCount: controller.result[0].length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 10,
                childAspectRatio: 3/3
            ),
            itemBuilder: (BuildContext context, int index){
              var int = index+1;
              return InkWell(
                onTap: (){
                  _navigateAndDisplaySelection(int);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    color: appBarColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          normalText(int.toString(), 15, Colors.white)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
